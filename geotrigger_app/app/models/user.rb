require 'bcrypt'
require 'geocoder'

class User < ActiveRecord::Base
	has_secure_password
	has_one :location
  
  validates_confirmation_of :email
  validates_presence_of :password_confirmation
  validates_presence_of :email_confirmation

  validates_uniqueness_of :email
  validates_presence_of :email

  # Geocodes location by address
  geocoded_by :full_street_address
  # after_validation :geocode, :if => :address_changed?

  # Geocode user location by IP address
  geocoded_by :ip_address,
  	:latitude => :lat, :longitude => :lon
  # after_validation :gecode

  def search_results
  	results = Geocoder.search("Golden Gate Park, San Francisco, CA")
  	parse_results = JSON.parse(results)
  end

  def self.confirm(email_param, password_param)
    user = User.find_by({email: email_param})
    if user
      user.authenticate(password_param)
    end
  end

end
