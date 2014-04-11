class PostsController < ApplicationController

  before_filter :validate_user
  before_filter :validate_group

  def index
    @posts = current_group.posts(:include => :user, :order => "created_at ASC", :limit => 10)

    respond_to do |format|
      format.html 
    end
  end

  def create
    @post = current_group.posts.new(params[:post])
    @post.user_id = current_user.id
    @post.school_id = current_user.school_id
    @post.save!

    respond_to do |format|
      format.js
    end
  end

end
