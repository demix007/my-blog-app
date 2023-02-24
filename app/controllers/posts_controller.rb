class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to user_posts_path(current_user), notice: 'Post created successfully'
    else
      flash.now[:alert] = @post.errors.full_messages.first if @post.errors.any?
      render :new, status: 400
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
