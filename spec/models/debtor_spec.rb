require 'rails_helper'

RSpec.describe Debtor, type: :model do
  context "Validates User" do

    let!(:debtor)        { build(:debtor) }

    it "Validates Name" do
      debtor.name = nil
      expect(debtor.valid?).to eql(false)
    end

    it "Validates address" do
      debtor.address = nil
      expect(debtor.valid?).to eql(false)
    end

    it "saves debtor" do
      expect(debtor.save).to eql(true)
    end
  end
end
