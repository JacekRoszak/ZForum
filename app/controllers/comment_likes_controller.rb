class CommentLikesController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create

    @comment_like = CommentLike.new
    @comment_like.post_comment_id = params[:comment_id]
    @comment_like.user_id = current_user.id
    @comment_like.save

    post = Post.find(params[:post_id])
    redirect_to post

  end

  def update
  end

  def destroy

    CommentLike.find(params[:commentlike_id]).destroy
    
    post = Post.find(params[:post_id])
    redirect_to post

  end

end
