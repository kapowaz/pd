module NP
  class Alert

    def initialize(player:, fleet:, star:, code:)
      @star = star
      @code = code
      @fleet = fleet
      @player = player
    end


    def call
      log
      send_push
    rescue => e
      puts "EXCEPTION RAISED"
      puts e.message
    end


    def log
      puts message
      puts "Code: #{@code}"
      puts "\n"
    end


    def send_push
      Prowl.add(
        apikey: ENV['PROWL_KEY'],
        priority: 2,
        application: 'Neptunes Pride - Attack',
        description: "#{message}\n\nCode: #{@code}"
      )
    end


    def message
      @message ||= "#{@player.name} with #{@fleet.ships_count} ships on #{@star.name}"
    end

  end
end
