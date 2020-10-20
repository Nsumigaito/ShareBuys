class Admins::PostsController < ApplicationController
	def index
		@posts = Post.where(is_report: true)
	end

	def show
		@post = Post.find(params[:id])
	end
end
