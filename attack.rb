module NP
  class Attack
    NAMESPACE = "np:attack:acknowledged"


    def self.acknowledge(code)
      key = "#{NAMESPACE}:#{code}"

      $redis.set(key, "yes")
    end


    def initialize(player:, fleet:, star:)
      @star = star
      @fleet = fleet
      @player = player
    end


    def alert
      if historic?
        puts "#{_code} - already acknoweldged"
        puts "\n"
      else
        alert = NP::Alert.new(
          player: @player,
          fleet: @fleet,
          star: @star,
          code: _code
        )
        alert.call
      end
    end


    def historic?
      $redis.get(_key) == "yes"
    end


    private


    def _code
      "#{@player.id}-#{@fleet.id}-#{@star.id}"
    end


    def _key
      "#{NAMESPACE}:#{_code}"
    end

  end
end
