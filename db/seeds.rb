# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ProductsUnderBid.create(product_id: 1, minimum_bidding_price: 24, bid_status: true, sell_status: false, bid_start_date: Date.today.to_formatted_s(:date), bid_start_time: "10:20", bid_end_date: Date.today.to_formatted_s(:date), bid_end_time: Time.zone.now.to_formatted_s(:time))
