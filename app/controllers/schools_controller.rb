class SchoolsController < ApplicationController
  
  def login
    if request.get?
      render
    else
      school = School.find_by_name(params[:login])
      if school.nil?
        school = School.new(:name => params[:login])
        school.save!
      end
      session[:current_school] = school

      redirect_to "/users"
    end
  end

  def logout
    session[:current_school] = nil
    redirect_to :action => :login
  end


end
