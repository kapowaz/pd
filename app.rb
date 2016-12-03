require './boot'

begin

  client = NP::Client.new(
    game_id: ENV['GAME_ID'],
    auth: ENV['AUTH'],
  )
  response = client.get

  fleets = response.fleets.select { |f| f.player_id.to_s != ENV['PLAYER_ID'] }

  fleets.each do |fleet|
    next if fleet.orders.empty?

    order = fleet.orders.first

    next if order.destination_star.player_id != ENV['PLAYER_ID']

    attack = NP::Attack.new(
      player: fleet.player,
      fleet: fleet,
      star: order.destination_star
    )
    attack.alert
  end

  puts "FINISHED --- #{Time.now.utc}"

rescue => e
  Prowl.add(
    apikey: ENV['PROWL_KEY'],
    priority: -2,
    application: 'Neptunes Pride - Error',
    description: e.message
  )
end
