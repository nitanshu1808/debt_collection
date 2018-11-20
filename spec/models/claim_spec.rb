require 'rails_helper'

RSpec.describe Claim, type: :model do
  context "validates Claim" do
    let!(:claim)                  { build(:claim) }

    it "Validates business presence" do
      claim.business_id   = nil
      expect(claim.valid?).to  eql(false)
    end

    it "validates amount presence" do
      claim.amount  = nil
      expect(claim.valid?).to  eql(false)
    end

    it "validates county presence" do
      claim.county  = nil
      expect(claim.valid?).to  eql(false)
    end

    it "saves claim" do
      expect(claim.save).to    eql(true)
    end
  end

  context "validates status and amount" do
    let!(:claim)                  { build(:claim) }

    it "verify claim amount" do
      claim.amount = 60
      expect(claim.valid?).to  eql(false)
      expect(claim.errors.full_messages.first).to  eql("Amount " + I18n.t("app.invalid_amount"))
    end

    it "raises argument error error on invalid status" do
      expect{claim.status  = 4}.to raise_error(ArgumentError)
    end

  end
end
