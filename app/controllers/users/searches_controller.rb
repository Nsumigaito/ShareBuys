class Users::SearchesController < ApplicationController
	def search
		@word = params[:word]

		if @word == nil
			redirect_to request.referrer
		else
			@users = User.search(@word).order("created_at DESC")
			@posts = Post.search(@word).order("created_at DESC")
		end
	end
end
