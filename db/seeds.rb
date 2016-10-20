# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Helper data structure to populate records
locations = ["Alabama", "Alaska", "Arizona", "Arkansas", 
            "California", "Colorado", "Connecticut", "Delaware",
            "District of Columbia", "Florida", "Georgia", "Hawaii",
            "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky",
            "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan",
            "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska",
            "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York",
            "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon",
            "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota",
            "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington",
            "West Virginia", "Wisconsin", "Wyoming"]


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
Product.create(user_id: 2, category_id: 4, name: "Mercedes F100", date_added: Date.today, location: locations[10])
Product.create(user_id: 5, category_id: 2, name: "Nikon D5300", date_added: Date.today, location: locations[2])
Product.create(user_id: 8, category_id: 8, name: "Jasmine S35 Acoustic Guitar", date_added: Date.today, location: locations[3])
Product.create(user_id: 1, category_id: 2, name: "Canon EOS Rebel T5i", date_added: Date.today, location: locations[7])
Product.create(user_id: 2, category_id: 4, name: "Nissan NV200", date_added: Date.today, location: locations[22])
Product.create(user_id: 2, category_id: 2, name: "Nikon D5", date_added: Date.today, location: locations[2])
Product.create(user_id: 2, category_id: 7, name: "Kutchina Fieona SS", date_added: Date.today, location: locations[4])
Product.create(user_id: 1, category_id: 2, name: "Nikon D750", date_added: Date.today, location: locations[15])
Product.create(user_id: 3, category_id: 5, name: "iPhone 6S", date_added: Date.today, location: locations[19])
Product.create(user_id: 6, category_id: 9, name: "Macbook Pro 2016", date_added: Date.today, location: locations[16])