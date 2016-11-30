require 'json'
require 'rest-client'

module NP
  class Client

    def initialize(game_id:, auth:)
      @game_id = game_id
      @auth = auth
    end


    def get
      response = RestClient.post(url, body, headers)

      Response.new(response.body)
    end


    private


    def url
      "https://np.ironhelmet.com/trequest/order"
    end

    def headers
      {
        content_length: 75,
        content_type: "application/x-www-form-urlencoded; charset=UTF-8",
        referer: "https://np.ironhelmet.com/game/#{@game_id}",
        origin: "https://np.ironhelmet.com",
        user_agent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6)",
        x_requested_with: "XMLHttpRequest",
        cookie: @auth
      }
    end

    def body
      "type=order&order=full_universe_report&version=&game_number=#{@game_id}"
    end
  end
end
