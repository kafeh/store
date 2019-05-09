class Api::V1::OrdersController < ApplicationController
	include Orderable

	before_action :user_authorize_request, only: [:buy, :show, :destroy]
	before_action :admin_authorize_request, only: [:log]
	before_action :set_order, only: [:buy, :destroy]
	before_action :set_order_by_id, only: [:log]
	before_action :set_order_user_by_id, only: [:show]

	# GET /orders/:id

	def show
		render json: {"order": @order, "items": @order.order_items}, status: :ok
	end

	# GET /orders/:id/log

	def log
		render json: { "order": @order, "items": @order.order_items, "user": @order.user }, status: :ok
	end

	# DELETE /orders/:id

	def destroy
		@order.destroy
		head :no_content
	end

	# PATCH /orders/:id

	def buy
		if @order.order_items.any?
			if @order.update(status: 1)
				@order.set_total
				@order.update_stock
				render json: {"order": @order, "items": @order.order_items}, status: :ok, location: api_v1_order_url(@order)
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

	def set_order_user_by_id
		begin
			@order = @current_user.orders.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render json: { errors: 'Order not found' }, status: :not_found
		end
	end

	def set_order_by_id
		begin
			@order = Order.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render json: { errors: 'Order not found' }, status: :not_found
		end
	end

end