class PostLikesController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @post_like = PostLike.new(:post_id => params[:post_id])
    @post_like.user_id = current_user.id
    @post_like.save
    post = Post.find(params[:post_id])
    redirect_to post
  end

  def update
  end

  def destroy
    @post_like = PostLike.find(params[:postlike_id])
    @post_like.destroy
    post = Post.find(params[:post_id])
    redirect_to post
  end

end
