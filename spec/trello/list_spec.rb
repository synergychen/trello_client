require "spec_helper"

describe Trello::List do
  before do
    @client = Trello::Client.new(key: "abc", token: "abc")
    @list = Trello::List.new(@client)
  end

  describe "#fetch_all" do
    it "returns all lists of a board" do
      uri_template = Addressable::Template.new "#{Trello::Client::BASE_URL}/1/boards/{id}/lists{?key,token}{&other*}"
      stub_request(:get, uri_template).
        to_return(body: mock_collection.to_json)
      expect(@list.fetch_all(board_id: "123")).to eq mock_collection
    end
  end

  describe "#fetch" do
    it "returns one list" do
      uri_template = Addressable::Template.new "#{Trello::Client::BASE_URL}/1/lists/{id}{?key,token}{&other*}"
      stub_request(:get, uri_template).
        to_return(body: mock_item.to_json)
      expect(@list.fetch(123)).to eq mock_item
    end
  end
end
