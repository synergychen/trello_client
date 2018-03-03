module Trello
  class List < ApiObject
    def fetch_all(board_id)
      super(board_id)
    end

    def fetch(id)
      super(id)
    end

    private

    def resources_url(board_id)
      "/1/boards/#{board_id}/lists"
    end

    def resource_url(id)
      "/1/lists/#{id}"
    end
  end
end
