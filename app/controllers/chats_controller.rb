class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]

  def index
    @chats = Chat.all
    @new_chat = Chat.new
  end

  def show
  end

  def new
    @chat = Chat.new
  end

  def edit
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.user_id = current_user.id
    if @chat.save
      redirect_to chats_path
    else
      render :new 
    end
  end

  def update
    if @chat.update(chat_params)
      fredirect_to @chat
    else
      render :edit 
    end
  end

  def destroy
    @chat.destroy
      redirect_to chats_url
  end

  private
    def set_chat
      @chat = Chat.find(params[:id])
    end

    def chat_params
      params.require(:chat).permit(:user_id, :content)
    end
end
