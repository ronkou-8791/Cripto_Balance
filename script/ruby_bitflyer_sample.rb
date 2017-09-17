require "open-uri"
require 'json'
require 'pry-rails'

binding.pry

body = open("https://api.bitflyer.jp/v1/", &:read)
excutations = open("https://api.bitflyer.jp/v1/getexecutions", &:read)
data = JSON.parse(body)


open(url) do |file|
  puts file.read
end

puts(data)
