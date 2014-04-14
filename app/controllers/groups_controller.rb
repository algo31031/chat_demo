class GroupsController < ApplicationController
  before_filter :validate_user, :except => :destroy
  before_filter :validate_school, :only => :destroy

  def index
    @groups = current_user.school.groups.find(:all, :include => :group_users, 
      :conditions => "group_users.user_id = #{current_user.id} OR groups.created_by_id = #{current_user.id}")

    respond_to do |format|
      format.html 
    end
  end

  def show
    session[:current_group] = current_user.school.groups.find(params[:id])
    redirect_to "/posts"
  end

  def new
    @group = current_user.school.groups.new
    @users = current_user.school.users

    respond_to do |format|
      format.html 
    end
  end

  def edit
    @group = current_user.school.groups.find(params[:id])
    @users = current_user.school.users
  end

  def create
    @group = Group.new(params[:group])
    @group.school_id = current_user.school_id

    if(params[:users].present?)
      @group.users = current_user.school.users.find(:all, :conditions => ["id in (?)", params[:users]])
    end

    respond_to do |format|
      if @group.save!
        format.html { redirect_to(@group, :notice => 'Group was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @group = current_user.school.groups.find(params[:id])
    @group.name = params[:group][:name]
    @group.group_users.destroy_all

    if(params[:users].present?)
      @group.users = current_user.school.users.find(:all, :conditions => ["id in (?)", params[:users]])
    end

    respond_to do |format|
      if @group.save!
        format.html { redirect_to(groups_url) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @group = current_user.groups.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
    end
  end
end
