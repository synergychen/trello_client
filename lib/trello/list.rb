module Trello
  class List < ApiObject
    def fetch_all(**args)
      raise unless args[:board_id]
      super
    end

    def fetch(id:)
      super
    end

    def add(board_id:, **args)
      @client.post("/1/lists", args.merge(idBoard: board_id))
    end

    private

    def resources_url(**args)
      "/1/boards/#{args[:board_id]}/lists"
    end

    def resource_url(id)
      "/1/lists/#{id}"
    end
  end
end
