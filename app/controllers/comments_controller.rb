class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment).merge(post_id: params[:post_id])
    end

end
