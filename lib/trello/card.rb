module Trello
  class Card < ApiObject
    def fetch_all(**args)
      raise unless args[:list_id]
      super
    end

    def fetch(id:)
      super
    end

    def add(list_id:, **args)
      @client.post("/1/cards", args.merge(idList: list_id))
    end

    def delete(id:)
      super
    end

    private

    def resources_url(**args)
      "/1/lists/#{args[:list_id]}/cards"
    end

    def resource_url(id)
      "/1/cards/#{id}"
    end
  end
end
