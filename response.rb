module NP
  class Response

    def initialize(body)
      body = JSON.parse(body, symbolize_names: true)

      @report = body[:report]
    end


    def stars
      @stars ||= @report[:stars].map do |id, props|
        s = Star.new(self)
        s.id = id
        s.name = props[:n]
        s.player_id = props[:puid]
        s
      end
    end


    def fleets
      @fleets ||= @report[:fleets].map do |id, props|
        f = Fleet.new(self)
        f.id = id
        f.name = props[:n]
        f.orders = props[:o]
        f.player_id = props[:puid]
        f.ships_count = props[:st]
        f
      end
    end


    def players
      @players ||= @report[:players].map do |id, props|
        p = Player.new(self)
        p.id = id
        p.name = props[:alias]
        p
      end
    end

  end
end
