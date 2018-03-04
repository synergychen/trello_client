module Trello
  class ApiObject
    def initialize(client)
      @client = client
    end

    def fetch_all(**args)
      @client.get(resources_url(args))
    end

    def fetch(id:)
      raise unless id
      @client.get(resource_url(id))
    end

    def add(**args)
      raise NotImplementedError
    end

    def delete(id:)
      raise unless id
      @client.delete(resource_url(id))
    end

    private

    def resources_url(**args)
      raise NotImplementedError
    end

    def resource_url(id)
      raise NotImplementedError
    end
  end
end
