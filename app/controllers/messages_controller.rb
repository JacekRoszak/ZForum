class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
    @contacts = current_user.contacts
    if params[:korespondent]
      @buddy = User.find(params[:korespondent])    
      @conversation_messages = (current_user.sent_messages.to_user(@buddy) + current_user.recived_messages.from_user(@buddy)).sort
    else
      @conversation_messages = []
    end
  end

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to @message, notice: 'Message was successfully created.' 
    else
      render :new 
    end
  end

  def update
    if @message.update(message_params)
      redirect_to @message, notice: 'Message was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_url, notice: 'Message was successfully destroyed.'
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:sender_id, :reciptient_id, :content, :korespondent)
    end
end
