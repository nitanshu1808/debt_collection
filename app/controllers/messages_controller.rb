class MessagesController < ApplicationController

  before_action :mark_notification_as_read, only: :index

  def index
    @user           = User.find_by(id: params["user_id"])
    @conversation   = Conversation.between(@user.id, current_user.id).first
    if @conversation.blank?
      @conversation  = current_user.sender_conversations.build(receiver_id: @user.id)
      @conversation.save
    end
    @messages      = @conversation.messages.order(created_at: :desc)
    @message       = @messages.build
  end

  def create
    @user           = User.find_by(id: params["receiver_id"])
    @message        = current_user.messages.build(message_params)
    if @message.save && @message.notify_user(@user)
      @message      = Message.new(conversation_id: message_params["conversation_id"])
    end
    @messages       = Message.where(conversation_id: message_params["conversation_id"])
  end

  private
  def message_params
    params.require(:message).permit(:conversation_id, :body)
  end

end
