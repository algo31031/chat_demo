class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.find(:all, :include => :user, :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  def create
    @post = Post.new(params[:post])
    @post.save!

    respond_to do |format|
      format.js
    end
  end

end
