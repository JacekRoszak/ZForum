class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:filter_topic] 
      if params[:filter_author]
        authors = User.where("name like ?", "%#{params[:filter_author]}%").pluck(:id)
        @posts = Post.where("topic like ?", "%#{params[:filter_topic]}%").where(user_id: authors)
      else
        @posts = Post.where("topic like ?", "%#{params[:filter_topic]}%")
      end
    else
      if params[:filter_author]
        authors = User.where("name like ?", "%#{params[:filter_author]}%").pluck(:id)
        @posts = Post.where(user_id: authors)
      else
        @posts = Post.all
      end
    end
  end

  def show
    @post_comment = PostComment.new
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.important = false
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.' 
    else
      render :new 
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.' 
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:user_id, :content, :topic, :important, :filter_author, :filter_topic)
    end
end
