require 'rails_helper'

RSpec.describe Provider, type: :model do
  context "Validates Provider" do
    let!(:provider)        { build(:provider) }

    it "valdates provider_name presence" do
      provider.provider_name = nil
      expect(provider.valid?).to eql(false)
    end

    it "valdates uid presence" do
      provider.uid = nil
      expect(provider.valid?).to eql(false)
    end

    it "valdates user_id presence" do
      provider.user_id = nil
      expect(provider.valid?).to eql(false)
    end

    it "saves provider" do
      expect(provider.save).to eql(true)
    end

  end
end
