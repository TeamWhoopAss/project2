class Activity < ActiveRecord::Base
	has_one :friend, :through => :friendship
	has_one :user, :through => :friendship

	# attr_accessor :ip_address
	# geocoded_by :ip_address,
 #           :latitude => :lat, :longitude => :lon
 #  	after_validation :geocode

  attr_accessible :address, :latitude, :longitude, :city, :state, :street, :zip, :lat, :lon

    def address
      [street, city, state, zip].compact.join(', ')
    end

    geocoded_by :address
    after_validation :geocode
end

# class Order < ActiveRecord::Base

#   attr_accessible :city, :customer_email, :customer_id, :delivery_date, :delivery_time, :street, :zipcode, :coupon, :total, :name, :items_with_day, :user_id, :shopping_cart_id, :extras, :latitude, :longitude, :location_name, :phone, :suite, :state

#   belongs_to :user

#   validates :name, :presence => true
#   validates :street, :presence => true
#   validates :city, :presence => true
#   validates :zipcode, :presence => true

#   def address
#     [street, city, state, "United States"].compact.join(', ')
#   end

#   geocoded_by :address
#   after_validation :geocode

# end

    # reverse_geocoded_by :lat, :lon
    # after_validation :reverse_geocode
    # :lat => :latitude, :lon => :longitude 

    # :latitude => :lat, :longitude => :lon
