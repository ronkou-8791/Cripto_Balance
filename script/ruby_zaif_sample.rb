require 'net/http'
require 'uri'
require 'json'

uri = URI.parse('https://api.bitflyer.jp/v1/')
json = Net::HTTP.get(uri)
result = JSON.parse(json)
puts result

 
