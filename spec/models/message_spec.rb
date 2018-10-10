require 'rails_helper'

RSpec.describe Message, type: :model do
  context "validates message" do
    let(:message)      { build(:message) }

    it "validates body presence" do
      message.body  = nil
      expect(message.valid?).to eql(false)
    end

    it "validates user presence" do
      message.user_id = nil
      expect(message.valid?).to eql(false)
    end

    it "validates conversation presence" do
      message.conversation_id = nil
      expect(message.valid?).to eql(false)
    end
  end
end
