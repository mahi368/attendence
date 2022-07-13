class UserStandardsController < ApplicationController

	# POST method for creating user_standards and Adding standard_id and user_id
	def create
		@user_standard =  UserStandard.find_by(user_id: params[:user_id])
		@student = User.find(params[:user_id])
		@role = Role.first

		# condition for enrollment that teacher and addes student cannot be able to enroll the particular class.
		if @user_standard || @role.users.map(&:id).include?(@student.id)
			flash[:alert] = "Student cannot be able to add"
		else
			@user_standard = UserStandard.new(standard_id: params[:standard_id], user_id: params[:user_id])
			@user_standard.save
		end
		redirect_to standard_path(id: params[:standard_id])
	end

	# DELETE method for removing students from a particular class
	def destroy
		 @user_standard = UserStandard.find_by(user_id: params[:id], standard_id: params[:standard_id] )
		 @user_standard.destroy
		 redirect_to standard_path(id: params[:standard_id])
	end
end
