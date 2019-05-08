class Api::V1::OrderItemsController < ApplicationController
	before_action :user_authorize_request, only: [:create, :destroy]

	before_action :set_order_by_user, only: [:create]
	before_action :set_order_item, only: [:destroy]

	def create
		order_item = @order.order_items.new(order_item_params)
		if order_item.check_stock
			if order_item.save  
				render json: order_item, status: :created 
			else
				render json: { errors: order_item.errors }, status: :unprocessable_entity
			end
		else
			render json: { errors: "Wrong quantity" }, status: :unprocessable_entity	
		end
	end

	def destroy
		@order_item.destroy!
		head :no_content
	end

	private

	def set_order_by_user
		if @current_user.orders.active.any?
			@order = @current_user.orders.active.first
		else
			@order = @current_user.orders.create
		end
	end

	def set_order
		@order = Order.find(params[:id])
	end

	def set_order_item
		@order_item = OrderItem.find(params[:order_item_id])
	end

	def order_item_params
		params.require(:order_item).permit(:product_id, :quantity)
	end

end
