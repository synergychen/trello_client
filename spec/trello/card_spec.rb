require "spec_helper"

describe Trello::Card do
  before do
    @client = Trello::Client.new(key: "abc", token: "abc")
    @card = Trello::Card.new(@client)
  end

  describe "#fetch_all" do
    it "returns a list of cards" do
      uri_template = Addressable::Template.new "#{Trello::Client::BASE_URL}/1/lists/{id}/cards{?key,token}{&other*}"
      stub_request(:get, uri_template).
        to_return(body: mock_collection.to_json)
      expect(@card.fetch_all(list_id: "123")).to eq mock_collection
    end
  end

  describe "#fetch" do
    it "returns one card" do
      uri_template = Addressable::Template.new "#{Trello::Client::BASE_URL}/1/cards/{id}{?key,token}{&other*}"
      stub_request(:get, uri_template).
        to_return(body: mock_item.to_json)
      expect(@card.fetch(123)).to eq mock_item
    end
  end
end
