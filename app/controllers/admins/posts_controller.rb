class Admins::PostsController < ApplicationController
	def index
		@posts = Post.where(is_report: true)
	end

	def show
		@post = Post.find(params[:id])
	end

	def cancel_report
		@post = Post.find(params[:id])
		@post.update(is_report: false)
		redirect_to admins_posts_path
	end
end
