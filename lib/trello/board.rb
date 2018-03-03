require "trello/api_object"

module Trello
  class Board < ApiObject
    def fetch_all
      super
    end

    def fetch(id)
      super(id)
    end

    private

    def resources_url(parent_id = nil)
      "/1/members/me/boards"
    end

    def resource_url(id)
      "/1/boards/#{id}"
    end
  end
end
