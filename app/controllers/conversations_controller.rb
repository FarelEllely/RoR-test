class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def new
    @conversation = Conversation.new
  end

  def show
    @conversation = Conversation.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  def create
    @conversation = current_user.conversations.build(conversation_params)
    if @conversation.save
      flash[:success] = 'Conversation created'
      redirect_to conversations_path
    else
      render 'new'
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title)
  end
end
