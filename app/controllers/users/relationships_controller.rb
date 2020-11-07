class Users::RelationshipsController < ApplicationController
	before_action :set_user

	def create
	    following = current_user.follow(@user)
	    if following.save
	      redirect_to request.referrer
	    else
	      redirect_to request.referrer
	    end
  	end

  	def destroy
	    following = current_user.unfollow(@user)
	    if following.destroy
	      redirect_to request.referrer
	    else
	      redirect_to request.referrer
	    end
  	end

  	private
  	def set_user
    	@user = User.find(params[:relationship], params[:follow_id])
  	end
end
