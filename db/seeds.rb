# Populate Category table
Category.create(name: "Electronics", description: "Generic electronics items not belonging to specific category")
Category.create(name: "Camera", description: "Camera and photo accessories")
Category.create(name: "Wardrobe", description: "Mens, Womens and Kid apparels")
Category.create(name: "Automobile", description: "Two and four wheelers")
Category.create(name: "Cell phone", description: "Mobile phones, tablets, PDAs etc.")
Category.create(name: "Fine art", description: "Fancy items e.g. painting")
Category.create(name: "Kitchen", description: "Kitchen appliances")
Category.create(name: "Musical instruments", description: "Musical instruments")
Category.create(name: "Computers", description: "Desktops, laptops, netbooks, notebooks")
Category.create(name: "Household", description: "Generic household items not belonging to specific category")


# Populate Product table
Product.create(user_id: 2, category_id: 4, name: "Mercedes F100", date_added: Date.today, location_id: 10)
Product.create(user_id: 3, category_id: 2, name: "Nikon D5300", date_added: Date.today, location_id: 2)
Product.create(user_id: 3, category_id: 8, name: "Jasmine S35 Acoustic Guitar", date_added: Date.today, location_id: 3)
Product.create(user_id: 1, category_id: 2, name: "Canon EOS Rebel T5i", date_added: Date.today, location_id: 7)
Product.create(user_id: 2, category_id: 4, name: "Nissan NV200", date_added: Date.today, location_id: 22)
Product.create(user_id: 2, category_id: 2, name: "Nikon D5", date_added: Date.today, location_id: 2)
Product.create(user_id: 2, category_id: 7, name: "Kutchina Fieona SS", date_added: Date.today, location_id: 2)
Product.create(user_id: 1, category_id: 2, name: "Nikon D750", date_added: Date.today, location_id: 15)
Product.create(user_id: 3, category_id: 5, name: "iPhone 6S", date_added: Date.today, location_id: 19)
Product.create(user_id: 3, category_id: 9, name: "Macbook Pro 2016", date_added: Date.today, location_id: 16)


# Populate ProductsUnderBid table
ProductsUnderBid.create(product_id: 2, winner_id: 0, minimum_bidding_price: 5, maximum_bidding_price: 30,
                        bid_status: true, sell_status: false, bid_start_date: Date.current, 
                        bid_start_time: Time.zone.now.to_formatted_s(:time), bid_end_date: Date.tomorrow, bid_end_time: Time.zone.now.to_formatted_s(:time))
ProductsUnderBid.create(product_id: 4, winner_id: 0, minimum_bidding_price: 54, maximum_bidding_price: 0,
                        bid_status: true, sell_status: false, bid_start_date: Date.current, 
                        bid_start_time: Time.zone.now.to_formatted_s(:time), bid_end_date: Date.tomorrow, bid_end_time: Time.zone.now.to_formatted_s(:time))
ProductsUnderBid.create(product_id: 10, winner_id: 0, minimum_bidding_price: 60, maximum_bidding_price: 0,
                        bid_status: true, sell_status: false, bid_start_date: Date.current, 
                        bid_start_time: Time.zone.now.to_formatted_s(:time), bid_end_date: Date.tomorrow, bid_end_time: Time.zone.now.to_formatted_s(:time))


# Populate Bid table
Bid.create(product_id: 2, user_id: 1, bid_amount: 20, bidding_date: Date.today,
            bidding_time: Time.zone.now.to_formatted_s(:time), bid_active: true)
Bid.create(product_id: 2, user_id: 2, bid_amount: 10, bidding_date: Date.today,
            bidding_time: Time.zone.now.to_formatted_s(:time), bid_active: true)
Bid.create(product_id: 2, user_id: 3, bid_amount: 30, bidding_date: Date.today,
            bidding_time: Time.zone.now.to_formatted_s(:time), bid_active: true)


# Populate User table
User.create! :email => 'user1@bid.com', :password => 'password', :password_confirmation => 'password'
User.create! :email => 'user2@bid.com', :password => 'password', :password_confirmation => 'password'
User.create! :email => 'user3@bid.com', :password => 'password', :password_confirmation => 'password'