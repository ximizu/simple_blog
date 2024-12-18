class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def my_posts
    @posts = Post.where(user_id: session[:user]["id"])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    redirect_to posts_path unless session[:user_id]
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user]["id"]

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to @post unless session[:user_id]
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.expect(post: [ :title, :body ])
    end
end
