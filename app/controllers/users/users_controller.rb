class Users::UsersController < ApplicationController
  before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
    if @user.point == nil
      @user.update(point: 0)
    end
    @posts = @user.posts.all
    @post_comments = @user.post_comments.all
    @favorite_posts = @user.favorites.all
	end

	def profile_edit
		@user = current_user
	end

	def profile_update
    @user = current_user
 	 	@user.assign_attributes(user_params)
  	if @user.update(user_params)
  		redirect_to user_path(@user)
  	else
  		render 'profile_edit'
  	end
	end

  def following
    @user = User.find(params[:id])
    @users = @user.followings.all
    render 'follows'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.reverse_of_relationships.all
    render 'followers'
  end

	def unsubscribe
	end

	def withdraw
    @user = current_user
    if @user.update(is_deleted: true)
      sign_out current_user #URLを踏ませずにコントローラーから直接サインアウトの指示を出す（device公式)
    end
    redirect_to root_path
  end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduction, :image,
										:point, :telephone, :is_deleted, :is_admin)
	end
end
