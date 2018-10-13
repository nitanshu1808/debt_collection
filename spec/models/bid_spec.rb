require 'rails_helper'

RSpec.describe Bid, type: :model do
  context "Validate Bid" do
    let!(:bid)                  { build(:bid) }

    it "verifies amount presence" do
       bid.amount = nil
       expect(bid.valid?).to  eql(false)
    end

    it "verifies amount presence" do
       bid.amount = nil
       expect(bid.valid?).to  eql(false)
    end

    it "saves bid" do
      bid.amount = 60
      expect(bid.save).to eql(true)
    end
  end

  context "validate attributes" do
    let!(:bid)                  { build(:bid) }

    it "verifies amount" do
      bid.amount = 5000000
      expect(bid.valid?).to  eql(false)
      expect(bid.errors.full_messages.first).to  eql(I18n.t("bid.invalid_amount"))
    end

    it "raises argument error error on invalid status and fee type" do
      expect{bid.status    = 4}.to raise_error(ArgumentError)
      expect{bid.fee_type  = 4}.to raise_error(ArgumentError)
    end

  end
end
