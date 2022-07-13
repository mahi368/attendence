class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_user!
	protected
	# added some extra parameters to devise User model 
	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:enrollment_number, :first_name,:temp, :last_name,:user_name, :email, :password, :password_confirmation, :remember_me) }
	  devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
	  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:enrollment_number, :first_name,:temp, :last_name, :email,:user_name, :password, :password_confirmation, :current_password) }
	end
end