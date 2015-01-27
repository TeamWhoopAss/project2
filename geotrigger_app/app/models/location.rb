class Location < ActiveRecord::Base
	attr_accessor :address, :latitude, :longitude
	
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode, :if => :address_changed?

	# field :coordinates, :type => Array
	# def address
	# 	[street, city, state, zipcode].compact.join(', ')
	# end
	
end
