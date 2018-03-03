module Trello
  class Card
    def initialize(client)
      @client = client
    end

    def fetch_all(list_id:)
      @client.get(cards_url(list_id))
    end

    def fetch(id)
      @client.get(card_url(id))
    end

    private

    def cards_url(list_id)
      "/1/lists/#{list_id}/cards"
    end

    def card_url(id)
      "/1/cards/#{id}"
    end
  end
end
