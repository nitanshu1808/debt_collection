require 'rails_helper'

RSpec.describe RequestForProposal, type: :model do
  context "Validates Request for Proposal" do
    let!(:rfp)  		{ build(:request_for_proposal) }

    it "saves rfp and updates claim rfp status" do
    	expect(rfp.save).to eql(true)
    	expect(rfp.claim.is_rfp).to eql(true)
    end

  end
end
