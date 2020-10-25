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
		@posts = Post.all
		@user = current_user
	end

	def show
		@post = Post.find(params[:id])
		@post_comment = PostComment.new
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	def report
		@post = Post.find(params[:id])
		@post.update(is_report: true)
		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:title, :body, :value, :is_report, :user)
	end
end
