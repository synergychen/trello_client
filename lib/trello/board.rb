module Trello
  class Board
    def initialize(client)
      @client = client
    end

    def fetch_all
      @client.get(boards_url)
    end

    def fetch(id)
      @client.get(board_url(id))
    end

    private

    def boards_url
      "/1/members/me/boards"
    end

    def board_url(id)
      "/1/boards/#{id}"
    end
  end
end
