class Users::SearchesController < ApplicationController
	def search
		@word = params[:word]

		if @word == nil
			redirect_to request.referrer
		else
			@users = User.search(@word)
			@posts = Post.search(@word)
		end
	end
end
