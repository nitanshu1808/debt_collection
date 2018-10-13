require 'rails_helper'

RSpec.describe CollectionArea, type: :model do
  context "valiates collection area" do

    let!(:collection_area)        { build(:collection_area) }

    it "validates name presence" do
      collection_area.name = nil
      expect(collection_area.valid?).to eql(false)
    end

    it "saves collection area" do
      expect(collection_area.save).to eql(true)
    end

  end

  context "Validates Uniqueness" do

    let!(:collection_area)            { create(:collection_area) }

    let!(:dup_collection_area)        { create(:collection_area) }


    it "verifies Uniqueness of collection area" do
      dup_collection_area.name = collection_area.name
      expect(dup_collection_area.valid?).to eql(false)
      expect(dup_collection_area.errors.full_messages.first).to eql(I18n.t("collection_area.unique"))
    end
  end

end
