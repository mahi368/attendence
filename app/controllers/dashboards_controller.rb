class DashboardsController < ApplicationController
  # "root_path" , dashboard page for faculty and students
  def index
      @standards = Standard.all
  end
end
