class AdminsController < ApplicationController
	before_action :admin_authorize_request, except: :create
	before_action :set_admin, except: [:create, :index]

	def index
		admins = Admin.all.order("updated_at DESC")
		render json: admins, status: :ok
	end

	def show
		render json: @admin, status: :ok
	end

	def create
		admin = Admin.new(admin_params)
		if admin.save
			render json: admin, status: :created
		else
			render json: { errors: admin.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def update
		unless @admin.update(admin_params)
			render json: { errors: @admin.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def destroy
		@admin.destroy
	end

	private

	def set_admin
		@admin = Admin.find_by_email!(params[:email])
	rescue ActiveRecord::RecordNotFound
		render json: { errors: 'Admin not found' }, status: :not_found
	end

	def admin_params
		params.permit(:name, :email, :password, :password_confirmation)
	end
end
