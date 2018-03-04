require "spec_helper"

describe Trello::Board do
  before do
    @client = Trello::Client.new(key: "abc", token: "abc")
    @board = Trello::Board.new(@client)
  end

  describe "#fetch_all" do
    it "returns a list of boards" do
      uri_template = Addressable::Template.new "#{Trello::Client::BASE_URL}/1/members/me/boards{?key,token}{&other*}"
      stub_request(:get, uri_template).
        to_return(body: mock_collection.to_json)
      expect(@board.fetch_all).to eq mock_collection
    end
  end

  describe "#fetch" do
    it "returns one board" do
      uri_template = Addressable::Template.new "#{Trello::Client::BASE_URL}/1/boards/{id}{?key,token}{&other*}"
      stub_request(:get, uri_template).
        to_return(body: mock_item.to_json)
      expect(@board.fetch(id: "123")).to eq mock_item
    end
  end
end
