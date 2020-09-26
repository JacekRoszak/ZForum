class PostCommentsController < ApplicationController
  before_action :set_post_comment, only: [:show, :edit, :update, :destroy]

  def index
    @post_comments = PostComment.all
  end

  def show
  end

  def new
    @post_comment = PostComment.new
    @post_comment.post_id = params[:post_id]
  end

  def edit
  end

  def create
    
    @post_comment = PostComment.new(post_comment_params)

    if @post_comment.save
      redirect_to @post_comment.post
    else
      render :new 
    end
  end

  def update
    if @post_comment.update(post_comment_params)
      redirect_to @post_comment.post
    else
      render :edit 
    end
  end

  def destroy
    @post_comment.destroy
    redirect_to post_comments_url, notice: 'Post comment was successfully destroyed.' 
  end

  private
    def set_post_comment
      @post_comment = PostComment.find(params[:id])
    end

    def post_comment_params
      params.require(:post_comment).permit(:content, :user_id, :post_id)
    end
end
