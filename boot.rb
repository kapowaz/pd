require 'redis'
require 'prowl'

require './objects'
require './response'
require './client'
require './alert'
require './attack'

ENV['REDIS_URL'] ||= 'redis://127.0.0.1:6379'

$redis = Redis.new(url: ENV['REDIS_URL'])

#
# NP::Attack.acknowledge("22-4-179")
#
