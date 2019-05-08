class Api::V1::ProductsController < ApplicationController
	include Orderable

	before_action :admin_authorize_request, only: [:create, :destroy, :update, :set_price]
	before_action :user_authorize_request, only: [:add_like]
	before_action :set_product, only: [:show, :update, :destroy, :set_price, :add_like]

	def index
		products = Product.available.order(ordering_params(params)).paginate(page: params[:page], per_page: 20)
		render json: products, status: :ok
	end

	def show
		render json: { "product": @product, "price": @product.get_price }, status: :ok
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

	def search_by_name
		products = Product.available.order(ordering_params(params)).search_by_name(params[:name]).paginate(page: params[:page], per_page: 20)
		render json: products, status: :ok
	end

	def add_like
		like = @product.like_products.new(user_id: @current_user.id)
		if like.save
			render json: like, status: :created
		else
			render json: { errors: like.errors }, status: :unprocessable_entity
		end
	end

	private

	def set_product
		begin
			@product = Product.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render json: { errors: 'Product not found' }, status: :not_found
		end
	end

	def product_params
		params.require(:product).permit(:name, :product_type_id, :stock)
	end

	def price_product_params
		params.require(:price_product).permit(:price)
	end

end
