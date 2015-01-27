class Location < ActiveRecord::Base
	attr_accessor :address, :latitude, :longitude, :street, :city, :zip, :state

	belongs_to :user

	def get_address
		#res = geocode --json "916 Union Street, San Francisco"
	end
end
