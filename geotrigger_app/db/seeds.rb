# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'

min_lat = 37.72429
max_lat = 37.80653
min_long = -122.47799
max_long = -122.40314

activity_tag = ["Coffee", "Dinner", "Drinks", "Date", "ShitShooting"]


# (1..500).each do
#   user = Hash.new
#   user[:email] = Faker::Internet.email
#   # user[:email_confirmation] = user[:email]
#   user[:password] = "blah"
#   user[:password_confirmation] = user[:password]
#   user[:first_name] = Faker::Name.first_name
#   user[:last_name] = Faker::Name.last_name
#   # user[:latitude] = Faker::Geolocation.lat
#   # user[:longitude] = Faker::Geolocation.lng
#   new_user = User.create(user)

(1..500).each do
  activity = Hash.new
  activity[:user_id] = rand(1..500)
  activity[:friend_id] = rand(1..500)
  activity[:activity_tag] = activity_tag[rand(4)]
  activity[:location_name] = Faker::Lorem.sentence(word_count = 3)
  activity[:activity_description] = Faker::Lorem.sentences(sentence_count = 3)
  # activity[:full_street_address] = Faker::Address.street_address(include_secondary = false)
  activity[:lat] = ((max_lat-min_lat)*rand()) + min_lat
  activity[:lon] = ((max_long-min_long)*rand()) + max_long
  new_activity = Activity.create(activity)
  end


