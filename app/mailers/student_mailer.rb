class StudentMailer < ApplicationMailer
	CONTACT = "vineetayuvasoft366@gmail.com", "sonimahima70@gmail.com","deepakyuvasoft372@gmail.com"
	def new_student
	    @student = params[:student]

	    mail(
	    	to: CONTACT ,
	    	subject: "Student added"
	    	)
	end
end
