class Api::V1::OrderItemsController < ApplicationController
	before_action :user_authorize_request, only: [:create, :update, :destroy]

	before_action :set_order, only: [:create]
	before_action :set_order_item, only: [:update, :destroy]

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

	def update
		if @order_item.update(order_item_update_params)
			render json: @order_item, status: :ok
		else
			render json: { errors: @order_item.errors }, status: :unprocessable_entity
		end
	end

	def destroy
		@order_item.destroy!
		head :no_content
	end

	private

	def set_order
		if @current_user.orders.active.any?
			@order = @current_user.orders.active.first
		else
			@order = @current_user.orders.create
		end
	end

	def set_order_item
		@order_item = OrderItem.find(params[:id])
	end

	def order_item_params
		params.require(:order_item).permit(:product_id, :quantity)
	end	

	def order_item_update_params
		params.require(:order_item).permit(:quantity)
	end

end
