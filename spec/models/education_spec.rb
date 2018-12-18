require 'rails_helper'

RSpec.describe Education, type: :model do
  context "Validate Education" do
    let(:education) { build(:education) }

    it "validates field_of_study presence" do
      education.field_of_study = nil
      expect(education.valid?).to eql(false)
    end

    it "validates institution presence" do
      education.institution = nil
      expect(education.valid?).to eql(false)
    end

    it "validates from_date presence" do
      education.from_date = nil
      expect(education.valid?).to eql(false)
    end

    it "validates to_date presence" do
      education.to_date = nil
      expect(education.valid?).to eql(false)
    end

    it "compares from and to date" do
      education.from_date = Time.now
      expect(education.valid?).to eql(false)
      expect(education.errors.full_messages.first).to eql("To date  should be less than From Date")
    end

  end
end
