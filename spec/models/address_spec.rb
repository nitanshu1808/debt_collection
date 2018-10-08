require 'rails_helper'

RSpec.describe Address, type: :model do
  context "validate Address" do

    let!(:address)        { build(:address) }

    it "valdates name presence" do
      address.name = nil
      expect(address.valid?).to eql(false)
    end

    it "valdates city presence" do
      address.city = nil
      expect(address.valid?).to eql(false)
    end

    it "valdates postal_code presence" do
      address.postal_code = nil
      expect(address.valid?).to eql(false)
    end

    it "valdates user presence" do
      address.user_id = nil
      expect(address.valid?).to eql(false)
    end

    it "save address" do
      expect(address.save).to eql(true)
    end

  end
end
