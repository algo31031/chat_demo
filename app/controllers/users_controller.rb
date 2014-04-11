class UsersController < ApplicationController

  before_filter :validate_school, :only => :index
  
  def index
    @users = current_school.users(:include => :group)
  end

  def login
    if request.get?
      @schools = School.all
    else
      school = School.find_by_id(params[:school_id])
      if school.blank?
        flash[:error] = "请选择学校"
        redirect_to "/users/login"
        return 
      end
      user = school.users.find_by_name(params[:login])
      if user.blank?
        user = User.new(:name => params[:login], :school_id => school.id)
        user.save!
      end
      session[:current_user] = user
      redirect_to "/groups"
    end
  end

  def logout
    session[:current_user] = nil
    session[:current_group] = nil
    redirect_to "/users/login"
  end



end