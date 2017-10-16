# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

csv_data = CSV.read('BTC.csv', headers: false)

Gain.new(purchase: csv_data[0][0], gain_price: csv_data[0][1])


Gain.new(purchase: csv_data[0], gain_price: csv_data[1])


csv_data.each {|data| Gain.create(purchase: Time.strptime(csv_data[0], "%Y年%m月%d日"), gain_price: csv_data[1])}
