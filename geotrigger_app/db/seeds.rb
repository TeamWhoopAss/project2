# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'


(1..100).each do
  user_params = Hash.new
  user_params[:email] = Faker::Internet.email
  user_params[:email_confirmation] = user_params[:email]
  user_params[:password] = "blah"
  user_params[:password_confirmation] = user_params[:password]
  user_params[:first_name] = Faker::Name.first_name
  user_params[:last_name] = Faker::Name.last_name
  # user_params[:latitude] = Faker::Geolocation.lat
  # user_params[:longitude] = Faker::Geolocation.lng
  new_user = User.create(user_params)

(1..100).each do
  activity_params = Activity.new
  activity_params[:tag] = Faker::Lorem.word
  activity_params[:name] = Faker::Lorem.sentence(word_count = 4)
  activity_params[:description] = Faker::Lorem.sentences(sentence_count = 3)
  activity_params[:full_street_address] = Faker::Address.street_address(include_secondary = false)
  # activity_params[:latitude] = Geolocation.lat
  # activity_params[:longitude] = Geolocation.lng
  activity_params[:time_created] = Time
  activity_params[:expiry] = Time

  end
end

