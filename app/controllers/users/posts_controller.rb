class Users::PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def special_new
		@post = Post.new
	end

	def create
		@user = User.find(current_user.id)
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if params[:normal]
			@post.value = 0
		end
		if @post.save
			redirect_to posts_path
		else
			render :new
		end
	end

	def index
		@user = current_user
	    @users = @user.followings.all
	    @posts = Post.where(user_id: @users).or(Post.where(user_id: @current_user)).order("created_at DESC")
	end

	def show
		@post = Post.find(params[:id])
		@post_comment = PostComment.new
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to request.referrer
	end

	def report
		@post = Post.find(params[:id])
		@post.update(is_report: true)
		redirect_to request.referrer
	end

	private
	def post_params
		params.require(:post).permit(:title, :body, :value, :is_report, :user)
	end
end
