require 'faraday'
require 'utilities/web/http_response'
require 'utilities/web/http_constants'

module IRacing
  class HTTPEngine
    def initialize(conn: Faraday.new)
      @conn = conn
    end

    def send_get_request(url:, body: {}, headers: {})
      send_http_request(
        url: url,
        body: body,
        method: HTTP::Methods::GET,
        headers: headers
      )
    end

    def send_post_request(url:, body: {}, headers: {})
      send_http_request(
        url: url,
        body: body,
        method: HTTP::Methods::POST,
        headers: headers
      )
    end

    private

    def send_http_request(url:, body:, method: HTTP::Methods::GET, format: HTTP::Formats::JSON, headers: {})
      response = case method
                 when HTTP::Methods::GET
                   @conn.get(url, headers)
                 when HTTP::Methods::POST
                   @conn.post(url, body, headers)
                 end
      HTTPResponse.new(response)
    end
  end
end