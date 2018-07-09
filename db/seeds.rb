require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Seed Users
user = {}
user['password'] = 'asdf'
#user['password_confirmation'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.unique.email
    #user['gender'] = rand(1..2)
    #user['phone'] = Faker::PhoneNumber.phone_number
    #user['country'] = Faker::Address.country
    #user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)

    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['description'] = Faker::Hipster.sentence
    listing['home_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample
    listing['address'] = Faker::Address.city
    listing['accommodates'] = rand(1..10)
    listing['bedroom'] = rand(1..8)
    listing['bathroom'] = rand(1..5)
    

    listing['is_kitchen'] = Faker::Boolean.boolean
    listing['is_internet'] = Faker::Boolean.boolean

    listing['price'] = rand(100..1500)
    
    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end