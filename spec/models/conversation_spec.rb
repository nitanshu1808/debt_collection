require 'rails_helper'

RSpec.describe Conversation, type: :model do
  context "Validate Conversation" do

    let!(:conversation)        { build(:conversation) }

    it "validates sender_id" do
      conversation.sender_id = nil
      expect(conversation.valid?).to eql(false)
    end

    it "validates receiver_id" do
      conversation.receiver_id = nil
      expect(conversation.valid?).to eql(false)
    end

    it "saves conversation" do
      expect(conversation.save).to eql(true)
    end

  end

  context "Verify two user have only one conversation" do
    let!(:conversation)        { create(:conversation) }
    let!(:new_conversation)    { build(:conversation)  }

    it "verifies uniqueness" do
      new_conversation.sender_id    = conversation.sender_id
      new_conversation.receiver_id  = conversation.receiver_id
      expect(new_conversation.valid?).to eql(false)
    end

    it "verifies sender and receiver identity" do
      new_conversation.sender_id    = conversation.sender_id
      new_conversation.receiver_id  = conversation.sender_id
      expect(new_conversation.valid?).to eql(false)
      expect(new_conversation.errors.full_messages.first).to eql(I18n.t("conversation.sndr_rcvr_unique"))
    end

  end
end
