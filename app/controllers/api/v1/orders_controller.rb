class Api::V1::OrdersController < ApplicationController
	before_action :user_authorize_request, only: [:add_item, :destroy_item, :buy]
	before_action :set_or_create_order, only: [:add_item, :buy]
	before_action :set_order_by_id, only: [:show]
	before_action :set_order_item, only: [:destroy_item]

	def show
		render json: @order, status: :ok
	end

	def add_item
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

	def destroy_item
		@order_item.destroy!
		head :no_content
	end

	def buy
		if @order.order_items.any?
			if @order.update(status: 1)
				@order.set_total
				@order.update_stock
				render json: @order, status: :ok, location: api_v1_order_url(@order)
			else
				render json: { errors: @order.errors }, status: :unprocessable_entity
			end
		else
			render json: { errors: "No product added" }, status: :unprocessable_entity
		end
	end

	private

	def set_or_create_order
		if @current_user.orders.active.any?
			@order = @current_user.orders.active.first
		else
			@order = @current_user.orders.create
		end
	end

	def set_order_by_id
		@order = Order.find(params[:id])
	end

	def set_order_item
		@order_item = OrderItem.find(params[:order_item_id])
	end

	def order_item_params
		params.require(:order_item).permit(:product_id, :quantity)
	end

end