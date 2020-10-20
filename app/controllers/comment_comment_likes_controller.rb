class CommentCommentLikesController < ApplicationController
  before_action :set_comment_comment_like, only: [:show, :edit, :update, :destroy]

  # GET /comment_comment_likes
  # GET /comment_comment_likes.json
  def index
    @comment_comment_likes = CommentCommentLike.all
  end

  # GET /comment_comment_likes/1
  # GET /comment_comment_likes/1.json
  def show
  end

  # GET /comment_comment_likes/new
  def new
    @comment_comment_like = CommentCommentLike.new
  end

  # GET /comment_comment_likes/1/edit
  def edit
  end

  # POST /comment_comment_likes
  # POST /comment_comment_likes.json
  def create
    @comment_comment_like = CommentCommentLike.new(comment_comment_like_params)

    respond_to do |format|
      if @comment_comment_like.save
        format.html { redirect_to @comment_comment_like, notice: 'Comment comment like was successfully created.' }
        format.json { render :show, status: :created, location: @comment_comment_like }
      else
        format.html { render :new }
        format.json { render json: @comment_comment_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_comment_likes/1
  # PATCH/PUT /comment_comment_likes/1.json
  def update
    respond_to do |format|
      if @comment_comment_like.update(comment_comment_like_params)
        format.html { redirect_to @comment_comment_like, notice: 'Comment comment like was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_comment_like }
      else
        format.html { render :edit }
        format.json { render json: @comment_comment_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_comment_likes/1
  # DELETE /comment_comment_likes/1.json
  def destroy
    @comment_comment_like.destroy
    respond_to do |format|
      format.html { redirect_to comment_comment_likes_url, notice: 'Comment comment like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_comment_like
      @comment_comment_like = CommentCommentLike.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_comment_like_params
      params.require(:comment_comment_like).permit(:user_id, :comment_id)
    end
end
