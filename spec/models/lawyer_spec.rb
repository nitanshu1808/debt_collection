require 'rails_helper'

RSpec.describe Lawyer, type: :model do
  context "Validates associated collection areas" do

    let!(:lawyer)                   { create(:lawyer) }

    let!(:collection_areas)         { CollectionArea.all }

    it "verifies associated collection areas" do
      lawyer.collection_areas << collection_areas
      expect(lawyer.collection_areas.size).to eql(CollectionArea.count)
    end

  end
end
