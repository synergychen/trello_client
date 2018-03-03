module Trello
  class List
    def initialize(client)
      @client = client
    end

    def fetch_all(board_id:)
      @client.get(lists_url(board_id))
    end

    def fetch(id)
      @client.get(list_url(id))
    end

    private

    def lists_url(board_id)
      "/1/boards/#{board_id}/lists"
    end

    def list_url(id)
      "/1/lists/#{id}"
    end
  end
end
