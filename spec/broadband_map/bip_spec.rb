require 'helper'

describe BroadbandMap::Client::Bip do

  before do
    @client = BroadbandMap::Client.new
  end
  
  describe ".bip_state_id" do
    before do
      stub_get("/bip/stateids/01,02?format=json").
        to_return(:status => 200, :body => fixture("bip_state_id.json"))
    end
    
    it "should return the correct item" do
      test = @client.bip_state_id(:state_ids => ['01', '02'])
      get("/bip/stateids/01,02?format=json")
      test.results[0].geographyId.should = "01"
    end
  end
end