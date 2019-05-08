class Api::V1::OrdersController < ApplicationController
	include Orderable

	before_action :user_authorize_request, only: [:buy, :show, :destroy]
	before_action :set_order, only: [:buy, :show, :destroy]

	def show
		render json: @order, status: :ok
	end

	def destroy
		@order.destroy
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

	def set_order
		begin
			@order = @current_user.orders.active.first!
		rescue ActiveRecord::RecordNotFound
			render json: { errors: 'Order not found' }, status: :not_found
		end
	end

end