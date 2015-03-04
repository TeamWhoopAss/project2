# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'

min_lat = 37.67960879019194
max_lat = 37.80653
min_long = -122.51129150390625
max_long = -122.40314
# activity_tag = ["Coffee", "Dinner", "Drinks", "Date", "ShitShooting"]


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


# i = 1
counts = Activity.count
i = 1
(i..counts).each do
  
  activity = Activity.find(i)
  activity.update_attributes({lon:(max_long-min_long)*rand() + min_long});
  activity.update_attributes({lat:(max_lat-min_lat)*rand() + min_lat});
  # activity[:id] = i
  # activity[:user_id] = rand(1..500)
  # activity[:friend_id] = rand(1..500)
  # activity[:activity_tag] = activity_tag[rand(4)]
  # activity[:location_name] = Faker::Lorem.sentence(word_count = 3)
  # activity[:activity_description] = Faker::Lorem.sentences(sentence_count = 3)
  # activity[:full_street_address] = Faker::Address.street_address(include_secondary = false)
  # activity[:lat] = ((max_lat-min_lat)*rand()) + min_lat
  # activity[:lon] = ((max_long-min_long)*rand()) + min_long
  # acitivy.save
  i = i + 1
  end

# lastUser = User.count
# i = 0

# (i..User.count).each do
#   friendship_id = rand(User.count)
#   user_friendship = Hash.new
#   user_friendship[:user_id] = i
#   user_friendship[:friend_id] = friendship_id
#   friend_friendship = Hash.new
#   friend_friendship[:user_id] = friendship_id
#   friend_friendship[:friend_id] = i
#   new_friend_friendship = Friendship.create(friend_friendship)
#   new_user_friendship = Friendship.create(user_friendship)
#   i+= 1
# en




# generates a random activity and associated properties
# [activity, description, fake location]
# activity_generator = [
# 	["Coffee","Lots of Lattes?","Not Starbucks"],
# 	["Drinks","Appletinis or Bust","Apples on Tapples"],
# 	["Movies","50 Shades of Gray? Grey?","Any Discreet Theater"],
# 	["Darts", "Throw pointy things!","Place Also Serving Alcohol"],
# 	["Billards","Let's Hustle Some Fools","Nearby Shady Pool Hall"],
# 	["Lunch","Lunch on Me in the Marina!","Royster's Oysters"],
# 	["Dinner","Dinner on You in the Marina","It's on you - wherever!"],
# 	["Brunch","Bottomless Mimosasssssssss (and maybe food...but probably not)","Dope Outdoor Patio"],
# 	["Swimming","Triatholon Training, Bro","My Personal Lap Pool"],
# 	["Board Games","Risky Business","Battlefied: Earth"],
# 	["Jogging","Suns out: Runs Out","Neighborhood Park"],
# 	["Crossfit","Let's do this once so we can brag about it","Unintentionally Public Place"],
# 	["Gravedigging","Looting for Diamonds","Six Feet Under"],
# 	["Tennis","Let's hit some balls mostly under the net...","Tennis and Winn-Uhs"],
# 	["Giraffe Spotting","Some giraffes escaped from the zoo. Let's Find them!","Higher Ground"],
# 	["Exhibitionist Painting","You paint, I'll nude model","Preferably outdoors"],
# 	["Biking and Hiking","Let's climb this mountain because we can","Nearby Range"],
# 	["Skydiving","Let's spice up our day!","The sky"]
# 	]


# counts = Activity.count
# i = 1
# (i..counts).each do
# 		current_activity_index = rand(activity_generator.length)
# 			activity = Activity.find(i)
# 			activity[:activity_tag] = activity_generator[current_activity_index][0]
# 			activity[:activity_description] = activity_generator[current_activity_index][1]
# 			activity[:location_name] = activity_generator[current_activity_index][2]
# 			activity.save
# 			i += 1
# end




# require "byebug"
#taken from seeds.rb to allow lookups of color and marker-symbol for each activity type
activity_generator = [
	["Coffee","Lots of Lattes?","Not Starbucks","#F0F8FF","Cafe"],
	["Drinks","Appletinis or Bust","Apples on Tapples", "#7FFFD4","Bar"],
	["Movies","50 Shades of Gray? Grey?","Any Discreet Theater", "#A52A2A","Cinema"],
	["Darts", "Throw pointy things!","Place Also Serving Alcohol", "#0000FF","Garden"],
	["Billards","Let's Hustle Some Fools","Nearby Shady Pool Hall","#006400","8"],
	["Lunch","Lunch on Me in the Marina!","Royster's Oysters","#006400","Fast Food"],
	["Dinner","Dinner on You in the Marina","It's on you - wherever!","#008B8B","Restaurant"],
	["Brunch","Bottomless Mimosasssssssss (and maybe food...but probably not)","Dope Outdoor Patio","#A9A9A9","Alcohol Shop"],
	["Swimming","Triatholon Training, Bro","My Personal Lap Pool","#8B008B","Swimming"],
	["Board Games","Risky Business","Battlefied: Earth","#8B0000","Land Use"],
	["Jogging","Suns out: Runs Out","Neighborhood Park","#8FBC8F","Pitch"],
	["Crossfit","Let's do this once so we can brag about it","Unintentionally Public Place","#FF8C00","Danger"],
	["Gravedigging","Looting for Diamonds","Six Feet Under","black","Cemetery"],
	["Tennis","Let's hit some balls mostly under the net...","Tennis and Winn-Uhs","#FF1493","Tennis"],
	["Giraffe Spotting","Some giraffes escaped from the zoo. Let's Find them!","Higher Ground","#D2691E","Zoo"],
	["Exhibitionist Painting","You paint, I'll nude model","Preferably outdoors","#D2691E","Art Gallery"],
	["Biking and Hiking","Let's climb this mountain because we can","Nearby Range","#ADFF2F","Bicycle"],
	["Skydiving","Let's spice up our day!","The sky","#87CEFA","Airport"]
	]

# current_activity = activity_generator[rand(activity_generator.length)]
# test = [current_activity[0],current_activity[3],current_activity[4]]
# print test
# byebug	

@all_acts = Activity.all
@geojson = Array.new

@all_acts.each do |activity|
	#matches index of array_generator to activity tag
	x = (0..activity_generator.length).map do |i|
	break i if activity_generator[i][0] === activity.activity_tag
	i + 1
	end
	@geojson << {
		'type' => 'Feature','geometry' => {
			'type' => 'Point',
			'coordinates' => [activity.lon, activity.lat]
		},
		'properties' => {
			'name' => activity.activity_tag,
			'location' => activity.location_name,
			'description' => activity.activity_description,
			'marker-size' => 'large',
			'marker-color' => activity_generator[x][3] ,
			'marker-symbol' => activity_generator[x][4] 
		}
	}
end

@geo_export = Generator.new({json:@geojson})
@geo_export.save