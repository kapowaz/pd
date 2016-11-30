module NP
  class BaseObject
    def initialize(response)
      @response = response
    end
  end


  class Star < BaseObject
    attr_accessor :id, :name, :player_id

    def player
      @response.players.find { |p| p.id.to_s == player_id.to_s }
    end
  end


  class FleetOrder < BaseObject
    attr_accessor :destination_star_id, :ships_count

    def destination_star
      @response.stars.find { |s| s.id.to_s == destination_star_id.to_s }
    end
  end


  class Fleet < BaseObject
    attr_accessor :id, :player_id, :name, :ships_count, :orders

    def player
      @response.players.find { |p| p.id.to_s == player_id.to_s }
    end

    def orders=(values)
      @orders = values.map do |order|
        o = FleetOrder.new(@response)
        o.destination_star_id = order[1]
        o
      end
    end
  end


  class Player < BaseObject
    attr_accessor :id, :name
  end
end
