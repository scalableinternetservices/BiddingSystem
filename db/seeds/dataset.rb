# Validate for required parameters
dataset_size = ENV["size"].to_i
abort("Specify the size of the data set: \n>>\t rails db:seed:dataset size=<dataset_size>") if dataset_size == 0


# Initialize seeding process
CONN = ActiveRecord::Base.connection
SEED = 0xDEADBEEF
srand SEED      # Predictable randomness helps in recreating the same test dataset across runs
MINIMUM_BIDDING_PRICE = 100
MAXIMUM_BIDDING_PRICE = 300
PRODUCT_TO_START_BID_ON_PROBABILITY = 0.50
PRODUCT_TO_PLACE_BID_ON_PROBABILITY = 0.50
BID_START_DATE_NEGATIVE_OFFSET = 3
BID_END_DATE_POSITIVE_OFFSET = 3
OLDEST_PRODUCT_ADDED_IS_NO_OLDER_THAN = 365
USER_COUNT = dataset_size
CATEGORY_COUNT = 100
PRODUCT_COUNT = dataset_size


# Populate User table
for i in 1..USER_COUNT
    user = User.new :email => 'user' + i.to_s + '@bid.com', :password => 'password', :password_confirmation => 'password'
    user.save!(:validate => false)
end


# Populate Category table
categories_records = []
for i in 1..CATEGORY_COUNT
    name = 'category_' + i.to_s
    description = 'this_is_the_description_of_category_' + i.to_s
    categories_records.push "('#{name}', '#{description}')"
end

sql = "INSERT INTO categories (name, description) VALUES #{categories_records.join(", ")}"
CONN.execute sql


# Populate Product table
products_records = []
for i in 1..PRODUCT_COUNT
    user_id = rand(1..USER_COUNT)
    category_id = rand(1..CATEGORY_COUNT)
    name = 'product_' + i.to_s
    date_added = Date.today - rand(OLDEST_PRODUCT_ADDED_IS_NO_OLDER_THAN)
    location_id = rand(1..51)
    image_file_name = 'product.jpg'
    image_content_type = 'image/jpeg'
    image_file_size = 16148
    products_records.push "(#{user_id}, #{category_id}, '#{name}', '#{date_added}', #{location_id}, '#{image_file_name}', '#{image_content_type}', #{image_file_size})"
end

sql = "INSERT INTO products (user_id, category_id, name, date_added, location_id, image_file_name, image_content_type, image_file_size) VALUES #{products_records.join(", ")}"
CONN.execute sql


# Populate ProductsUnderBid and Bid tables
products_unde_bids_records = []
bids_records = []

for product_id in 1..PRODUCT_COUNT

    # Generate data for ProductsUnderBid table excluding maximum_bidding_price
    # Select this product to start bid on with probability between [0..PRODUCT_TO_START_BID_ON_PROBABILITY]
    start_bid_probability = rand()
    next if start_bid_probability > PRODUCT_TO_START_BID_ON_PROBABILITY
    
    winner_id = 0
    minimum_bidding_price = rand(MINIMUM_BIDDING_PRICE..MAXIMUM_BIDDING_PRICE)
    bid_status = 't'
    sell_status = 'f'
    bid_start_date = Date.today - rand(BID_START_DATE_NEGATIVE_OFFSET)
    bid_start_time_sec = (Time.zone.now - ((rand(24) * 60 + rand(60)) * 60 + rand(60)))
    bid_start_time = bid_start_time_sec.to_formatted_s(:time)
    bid_end_date = bid_start_date + rand(BID_END_DATE_POSITIVE_OFFSET)
    bid_end_time_sec = (bid_start_time_sec + ((rand(24) * 60 + rand(60)) * 60 + rand(60)))
    bid_end_time = bid_end_time_sec.to_formatted_s(:time)
    
    # Generate data for Bid table
    # Select this product to place bid on with probability between [0..PRODUCT_TO_PLACE_BID_ON_PROBABILITY]
    place_bid_probability = rand()
    
    # What if no user is placing bid on the product?
    if place_bid_probability > PRODUCT_TO_PLACE_BID_ON_PROBABILITY
        maximum_bidding_price = 0
        products_unde_bids_records.push "(#{product_id}, #{winner_id}, #{minimum_bidding_price}, #{maximum_bidding_price}, '#{bid_status}', '#{sell_status}', '#{bid_start_date}', '#{bid_start_time}', '#{bid_end_date}', '#{bid_end_time}')"
        next
    end
    
    # Generate users to bid on this product
    user_count_to_place_bid_on_the_product = rand(1..((1 / PRODUCT_TO_START_BID_ON_PROBABILITY) * (1 / PRODUCT_TO_PLACE_BID_ON_PROBABILITY))).to_i
    user_id = rand(1..USER_COUNT / user_count_to_place_bid_on_the_product).to_i
    maximum_bidding_price = 0

    for i in 1..user_count_to_place_bid_on_the_product
        bid_amount = minimum_bidding_price + rand(MAXIMUM_BIDDING_PRICE - minimum_bidding_price)
        maximum_bidding_price = bid_amount if bid_amount > maximum_bidding_price    # Update maximum_bidding_price
        bidding_date = Date.today - rand(BID_START_DATE_NEGATIVE_OFFSET)
        bidding_time = bid_start_time_sec.to_formatted_s(:time)
        bid_active = 't'
        user_id += rand(1..user_count_to_place_bid_on_the_product)      # Generate next user to bid on the product
        
        # Push the Bid record    
        bids_records.push "(#{product_id}, #{user_id}, #{bid_amount}, '#{bidding_date}', '#{bidding_time}', '#{bid_active}')"
    end
    
    # Push the ProductsUnderBid record
    products_unde_bids_records.push "(#{product_id}, #{winner_id}, #{minimum_bidding_price}, #{maximum_bidding_price}, '#{bid_status}', '#{sell_status}', '#{bid_start_date}', '#{bid_start_time}', '#{bid_end_date}', '#{bid_end_time}')"
end

sql = "INSERT INTO products_under_bids (product_id, winner_id, minimum_bidding_price, maximum_bidding_price, bid_status, sell_status, bid_start_date, bid_start_time, bid_end_date, bid_end_time) VALUES #{products_unde_bids_records.join(", ")}"
CONN.execute sql if products_unde_bids_records.size != 0

sql = "INSERT INTO bids (product_id, user_id, bid_amount, bidding_date, bidding_time, bid_active) VALUES #{bids_records.join(", ")}"
CONN.execute sql if bids_records.size != 0


=begin
Effectively seeding Bid table is insanely difficult. Why? Seeding is easy.
Right? Plain wrong! Try to figure out how many untold constraints
are there, apart from the constraints those come from application logic.
   1. bid_timestamp (date & time) has to be between bid_start_timestamp & bid_end_timespamp in ProductsUnderBids table
   2. Bids have be on products which are active in ProductsUnderBids table
   3. product_ids must not occur in any particular order in Bids table
   4. user_ids must not occur in any particular order in Bids tabl
   5. Bid amount has to be randomized
   6. There have to random number of users bidding on a random subset of active bids
   7. There have to be inactive (revoked) bids
   8. There has to be at least one bid with amount equal to maximum bidding price as in ProductsUnderBids table
   9. There has to be a single row corresponding to a user bidding on a product
   10. Trending products with large number of bids

Difficult: [1-4, 10], Easy: [5-9]
=end