class StandardsController < ApplicationController
  #callback for show edit update destroy method to find particular class and remove lines of code
  before_action :find_params, only: %i[ show edit update destroy ] 
  load_and_authorize_resource except: :create

  # standards/show.html.erb in views
  def show 
    @student = @standard.users
    @query = @student.ransack(params[:q])
    @students = @query.result
    @attendence = Attendence.new()
     respond_to do |format|
      format.html
      format.csv { send_data @student.to_csv, filename: "attendence-#{Date.today}.csv" }
    end
  end

  # standards/new.html.erb in views
  def new
    @standard = Standard.new()
  end

  # POST method for creating a new class
  def create
    @standard = Standard.new(class_name: params[:standard][:class_name])
    @standard.save
    redirect_to root_path
  end

  # standards/edit.html.erb in views
  def edit
  end

  # PUT method for updating an existing class
  def update
    @standard.update(class_name: params[:standard][:class_name])
    redirect_to root_path
  end

  # DELETE method to delete an existing class
  def destroy
    @standard.destroy
    redirect_to root_path
  end

  # POST method to create attendence
  def create_attendence 

    @student = User.find(params[:user_id])
    @standard = Standard.find(params[:standard])

    if params[:attendence] == "true"

      if @student.attendences.count < 1
        @attendence = @student.attendences.new(standard_id: @standard.id)
        @attendence.save
      end

    else  

      @attendence = @student.attendences.find_by(standard_id: params[:standard])
      @attendence.destroy

    end

     redirect_to standard_path(@standard.id)
  end

  # GET method for generating and downloading data into .pdf format
  def download_pdf
    @standard = Standard.find(params[:standard_id])
    send_data generate_pdf(@standard),
              filename: "#{@standard.class_name}.pdf",
              type: "application/pdf"
  end

  private

  def generate_pdf(standard)
    standard = Standard.find(params[:standard_id])
    Prawn::Document.new do
      text standard.class_name, align: :center
      standard.users.each do |data| 
        text "Enrollment_number: #{data.enrollment_number}"
        text "Email: #{data.email}"
        text "Name : #{data.first_name + " " + data.last_name}"
        text "User name : #{data.user_name}"
        text "Attendence : #{data.attendences.count}"
        text "\n"
      end
    end.render
  end

  def find_params
    @standard = Standard.find(params[:id])
  end

end
