class AdminAuthenticationController < ApplicationController
	before_action :admin_authorize_request, except: :login

	def login
		puts "*****#{params}*****"
		@admin = Admin.find_by_email(params[:email])

		if @admin&.authenticate(params[:password])
			token = JsonWebToken.encode(admin_id: @admin.id)
			time = Time.now + 24.hours.to_i
			puts "***** Admin: #{@admin.inspect} *****"
			puts "***** Token: #{@admin.inspect} *****"
			render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"), email: @admin.email }, status: :ok
		else
			render json: { error: 'unauthorized' }, status: :unauthorized
		end
	end

	private

	def login_params
		params.permit(:email, :password)
	end
end
