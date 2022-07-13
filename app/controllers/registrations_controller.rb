class RegistrationsController < Devise::RegistrationsController
	after_action :set_role , only: :create

	def set_role
		@role = Role.find(params[:user][:role_ids])
		@user.roles << @role 
	end
	
end
