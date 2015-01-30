class Activity < ActiveRecord::Base
	has_one :friend, :through => :friendship
	has_one :user, :through => :friendship

	attr_accessor :ip_address
	geocoded_by :ip_address,
           :latitude => :lat, :longitude => :lon
  	after_validation :geocode
end
