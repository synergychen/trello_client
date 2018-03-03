module Trello
  class NetHttpClient
    def initialize(base_uri)
      @connection = Net::HTTP.new(base_uri.host, base_uri.port)
      @connection.use_ssl = true if base_uri.scheme == "https"
    end

    def perform(method, path, body = nil, headers = {})
      raise unless [:get, :put, :post, :delete].include?(method)

      req = eval("Net::HTTP::#{method.capitalize}").new(path)
      req["Content-Type"] = "application/json"
      req.body = body

      resp = @connection.request(req)
      JSON.parse(resp.body)
    end
  end
end
