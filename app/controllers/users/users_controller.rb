class Users::UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def profile_edit
		@user = current_user
	end

	def profile_update
 	 	current_user.assign_attributes(user_params)
  	if current_user.save
  		redirect_to users_path
  	else
  		render :edit
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
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduce, :image,
										:point, :telephone, :is_deleted, :is_admin)
	end
end
