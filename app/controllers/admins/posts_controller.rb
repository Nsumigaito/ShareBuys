class Admins::PostsController < ApplicationController
	def index
		@posts = Post.where(is_report: true)
	end

	def comment_index
		@post_comments = PostComment.where(is_report: true)
	end

	def show
		@post = Post.find(params[:id])
	end

	def cancel_comment_report
		@post_comment = PostComment.find(params[:id])
		@post_comment.update(is_report: false)
		redirect_to admins_post_comments_path
	end

	def cancel_report
		@post = Post.find(params[:id])
		@post.update(is_report: false)
		redirect_to admins_posts_path
	end
end
