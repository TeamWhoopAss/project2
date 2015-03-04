
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
all_acts = Activity.all
geojson = Array.new

all_acts.each do |activity|
	
	x = (0..activity_generator.length).map do |i|
	break i if activity_generator[i][0] === activity.activity_tag
	i + 1
	end
	
	geojson << {
		type: 'Feature',
		geometry: {
			type: 'Point',
			coordinates: [activity.lon, activity.lat]
		},
		properties: {
			name: activity.activity_tag,
			location: activity.location_name,
			description: activity.activity_description,
			:'marker-size' => 'large',
			:'marker-color' => activity_generator[x][3] ,
			:'marker-symbol' => activity_generator[x][4] 
		}
	}
end

print geojson