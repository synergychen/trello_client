require "trello/net_http_client"

module Trello
  class Client
    BASE_URL = "https://api.trello.com"

    def initialize(key:, token:)
      raise unless key && token
      @key = key
      @token = token
      @http_client = NetHttpClient.new(URI.parse(BASE_URL))
    end

    def get(path)
      @http_client.perform(:get, with_key_and_token(path))
    end

    def post(path, body = {})
      @http_client.perform(:post, with_key_and_token(path), body.to_json)
    end

    def delete(path)
      @http_client.perform(:delete, with_key_and_token(path))
    end

    private

    def with_key_and_token(path)
      path + "?key=#{@key}&token=#{@token}"
    end
  end
end
