class MessagesController < ApplicationController
  def index
    debugger
    @user           = User.find_by(id: params["user_id"])
    @conversation   = Conversation.between(@user.id, current_user.id)
    if @conversation.blank?
      @conversation = current_user.sender_conversations.create(@user.id)
    end
    @message       = @conversation.first.messages.build
  end

  def create
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
