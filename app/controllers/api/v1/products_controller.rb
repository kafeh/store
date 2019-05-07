class Api::V1::ProductsController < ApplicationController
	before_action :admin_authorize_request, only: [:create, :destroy, :set_price]
	before_action :set_product, only: [:show, :update, :destroy, :set_price, :get_price]
	

	def index
		products = Product.where('stock > 0').order('updated_at desc')
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
			render json: { errors: product.errors }, status: :unprocessable_entity
		end
	end

	def update
		if @product.update(product_params)
			render json: @product, status: :ok
		else
			render json: { errors: @product.errors }, status: :unprocessable_entity
		end
	end

	def destroy
		@product.destroy
		head :no_content
	end

	def set_price
		price_product = @product.price_products.new(price_product_params)
		if price_product.save
			render json: price_product, status: :created, location: api_v1_product_url(@product)
		else
			render json: { errors: product.errors }, status: :unprocessable_entity
		end
	end

	def get_price
		price_product = @product.get_price
		render json: { "price": price_product }, status: :ok
	end

	private

	def set_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name, :product_type_id, :price, :stock)
	end

end
