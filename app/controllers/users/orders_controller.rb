class Users::OrdersController < ApplicationController
	def confilm
		@post = Post.find(params[:id])
		@user = current_user
		@order = Order.new
	end

	def create
		@order = current_user.orders.build(order_params)
		@order.save(order_params)
		@user = current_user
		@point = @user.point - @order.value
		@user.update(point: @point)
		redirect_to orders_path
	end

	def index
		@orders = current_user.orders.order("created_at DESC")
	end

	private
	def order_params
		params.require(:order).permit(:name, :image, :title, :value, :comment_count, :favorite_count, :user_number, :post_number)
	end
end
