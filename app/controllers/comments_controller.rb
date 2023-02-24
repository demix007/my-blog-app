class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:posts_id])
    @comment = @post.comments.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:posts_id])
    @comment = @user.comments.new(text: comment_params[:text], posts_id: @post.id, author_id: @user.id)

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment added successfully'
    else
      flash.now[:alert] = @comment.errors.full_messages.first if @comment.errors.any?
      render :new, status: 400
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.destroy
      redirect_to user_post_path(user_id: current_user.id, id: @comment.posts_id),
                  notice: 'Comment deleted successfully'
    else
      flash.new[:alert] = @comment.errors.full_messages.first if @comment.errors.any?
      render :show, status: 400
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
