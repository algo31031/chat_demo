# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :current_user, :current_school, :current_group

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  protected

  def validate_school
    if current_school.blank?
      redirect_to "/schools/login"
      return
    end
  end

  def validate_user
    if current_user.blank?
      redirect_to "/users/login"
      return
    end    
  end

  def validate_group
    if current_group.blank?
      redirect_to "/groups"
      return
    elsif !current_user.groups.include?(current_group)
      flash[:error] = "sorry, but you've not invited"
      redirect_to
    end    
  end  

  private

  def current_school
    session[:current_school]
  end

  def current_user
    session[:current_user]
  end

  def current_group
    session[:current_group]
  end

end
