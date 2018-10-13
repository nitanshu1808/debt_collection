require 'rails_helper'

RSpec.describe Lawyer, type: :model do
  context "Validates associated collection areas" do

    let!(:lawyer)                   { create(:lawyer) }

    let!(:collection_areas)         { create_list(:collection_area, 20) }

    it "verifies associated collection areas" do
      lawyer.collection_areas << collection_areas
      expect(lawyer.collection_areas.size).to eql(20)
    end

  end
end
