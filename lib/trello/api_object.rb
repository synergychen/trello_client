module Trello
  class ApiObject
    def initialize(client)
      @client = client
    end

    def fetch_all(parent_id = nil)
      @client.get(resources_url(parent_id))
    end

    def fetch(id)
      @client.get(resource_url(id))
    end

    private

    def resources_url(parent_id = nil)
      raise NotImplementedError
    end

    def resource_url(id)
      raise NotImplementedError
    end
  end
end
