class Users::PostCommentsController < ApplicationController
	def create
		post = Post.find(params[:post_id])
		comment = current_user.post_comments.new(post_comment_params)
		comment.post_id = post.id
		comment.save
		redirect_to request.referrer
	end

	def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to request.referrer
	end

	def report
		PostComment.find_by(id: params[:id], post_id: params[:post_id]).update(is_report: true)
		redirect_to request.referrer
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment, :is_report)
	end
end
