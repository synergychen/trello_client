module Trello
  class Card < ApiObject
    def fetch_all(list_id)
      super(list_id)
    end

    def fetch(id)
      super(id)
    end

    private

    def resources_url(list_id)
      "/1/lists/#{list_id}/cards"
    end

    def resource_url(id)
      "/1/cards/#{id}"
    end
  end
end
