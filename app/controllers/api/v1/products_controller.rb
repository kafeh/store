class Api::V1::ProductsController < ApplicationController
	before_action :set_product, only: [:show, :update, :destroy]

	def index
		products = Product.all.order('updated_at desc')
		render json: products, status: :ok
	end

	def show
		render json: @product, status: :ok
	end

	def create
		product = Product.new(product_params)
		if product.save
			render json: product, status: :created, location: api_v1_product_url(product)
		else
			render json: product.errors, status: :unprocessable_entity
		end
	end

	def update
		if @product.update(product_params)
			render json: @product, status: :ok
		else
			render json: @product.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@product.destroy
		head :no_content
	end

	private

	def set_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name, :product_type_id, :price, :stock)
	end
end
