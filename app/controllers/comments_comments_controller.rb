class CommentsCommentsController < ApplicationController
  before_action :set_comments_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments_comments = CommentsComment.all
  end

  def show
  end

  def new
    @comments_comment = CommentsComment.new
    @comments_comment.postcomment_id = params[:postcomment_id]
  end

  def edit
  end

  def create
    @comments_comment = CommentsComment.new(comments_comment_params)
    @comments_comment.user_id = current_user.id

    if @comments_comment.save
      redirect_to @comments_comment.post_comment.post
    else
      render :new 
    end
  end

  def update
    if @comments_comment.update(comments_comment_params)
      redirect_to @comments_comment, notice: 'Comments comment was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @comments_comment.destroy
    redirect_to comments_comments_url, notice: 'Comments comment was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments_comment
      @comments_comment = CommentsComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comments_comment_params
      params.require(:comments_comment).permit(:content, :user_id, :postcomment_id)
    end
end
