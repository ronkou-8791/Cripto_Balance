require "open-uri"
require 'json'


body = open("https://coincheck.com/api/trades?offset=99", &:read)
#excutations = open("https://coincheck.com/api/trades?offset=99/getexecutions", &:read)
data = JSON.parse(body)


puts(data)
# NG.全取引履歴が100件までしか取得できない
# 50ずつしか取れないので、idを保持しておいて、offsetを使って途中から取得

# このコードいらない？
# data.each do |d|
#   # Share.create(create_at: d['create_at'],id: d['id'])
#   puts(d['id'])
# end

# body = open("https://coincheck.com/api/trades?offset=102", &:read)
# data = JSON.parse(body)
#
# puts("以下")
# # data.uniq!
#
# data.each do |d|
#
#   # Share.create(create_at: d['create_at'],id: d['id'])
#   puts(d['id'])
# end

# data['data']['children'].each do |child|
#     puts child['data']['body']
# end

# body = open("https://coincheck.com/api/order_books", &:read)
# print(body.class)
