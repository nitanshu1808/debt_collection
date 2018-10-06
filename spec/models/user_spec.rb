require 'rails_helper'

RSpec.describe User, type: :model do
  context "validate User" do

    let!(:user)        { build(:lawyer) }

    it "valdates user_name presence" do
      user.user_name = nil
      expect(user.valid?).to eql(false)
    end

    it "valdates email presence" do
      user.email = nil
      expect(user.valid?).to eql(false)
    end

    it "valdates name presence" do
      user.name = nil
      expect(user.valid?).to eql(false)
    end

    it "valdates password presence" do
      user.password = nil
      expect(user.valid?).to eql(false)
    end

    it "valdates address presence" do
      user.address = nil
      expect(user.valid?).to eql(false)
    end

    it "valdates county presence" do
      user.county = nil
      expect(user.valid?).to eql(false)
    end

    it "valdates county presence" do
      user.county = nil
      expect(user.valid?).to eql(false)
    end

    it "save user" do
      expect(user.save).to eql(true)
    end

  end

  context "verifies user with duplicate email" do
    let!(:user)           { create(:lawyer) }
    let!(:duplicate_user) { build(:lawyer) }

    it "verifies email uniqueness" do
      duplicate_user.email = user.email
      expect(duplicate_user.valid?).to eql(false)
      expect(duplicate_user.errors.full_messages.first).to eql(I18n.t("user.already_exist"))
    end
  end

  

  context "validate user password" do
    let!(:user)           { build(:lawyer) }
    let!(:passwd)         {"nik123"}
    
    it "verifies user password" do
      user.password  = passwd
      user.save
      expect(user.valid_password?(passwd)).to eql(true)
    end
  end

end
