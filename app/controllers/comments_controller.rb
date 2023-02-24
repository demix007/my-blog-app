class CommentsController < ApplicationController
    
    def new
        @post = Post.find(params[:post_id])
        @comment = Comment.new
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.new(comment_params)
        @comment.author = current_user
        @comment.post = @post
    
        if @comment.save
          redirect_to user_post_path(user_id: @post.author.id, id: @post.id), notice: 'Comment added successfully'
        else
          flash.now[:alert] = @comment.errors.full_messages.first if @comment.errors.any?
          render :new, status: 400
        end
    end
end
