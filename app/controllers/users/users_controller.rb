class Users::UsersController < ApplicationController
	def show
		@user = current_user
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

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduce, :image,
										:point, :telephone, :is_deleted, :is_admin)
	end
end
