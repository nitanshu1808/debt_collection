require 'rails_helper'

RSpec.describe WorkExperience, type: :model do
  context "Validates Work Experience" do
    let(:work_experience)   { build(:work_experience) }

      it "validates From date presence" do
        work_experience.from_date = nil
        expect(work_experience.valid?).to eql(false)
      end

      it "validates To date presence" do
        work_experience.to_date = nil
        expect(work_experience.valid?).to eql(false)
      end

      it "validates Lawyer presence" do
        work_experience.lawyer_id = nil
        expect(work_experience.valid?).to eql(false)
      end

      it "Validates Designation Presence" do
        work_experience.designation = nil
        expect(work_experience.valid?).to eql(false)
      end

      it "Validates Company Name Presence" do
        work_experience.company_name = nil
        expect(work_experience.valid?).to eql(false)
      end

      it "save work experience" do
        expect(work_experience.save).to eql(true)
      end

  end
end
