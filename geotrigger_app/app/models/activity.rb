class Activity < ActiveRecord::Base
	has_one :friend, :through => :friendship
	has_one :user, :through => :friendship

  # @@activities
  # @@activity

  # def get_activity
  #   activity = request.activity
  #   return activity
  # end

  def self.to_json
    @activities = Activity.all
    @geojson = []
    
    @activities.each do |activity|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [activity.latitude, activity.longitude]
        },
        properties: {
          id: activity.id,
          name: activity.location_name,
          number: activity.activity_tag,
          description: activity.activity_description,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
    end
  end


  attr_accessor :geoJson, :activity_description, :activity_name, :latitude, :longitude, :street, :address
	# attr_accessor :ip_address
	# geocoded_by :ip_address,
 #           :latitude => :lat, :longitude => :lon
 #  	after_validation :geocode

  attr_accessible :address, :latitude, :longitude, :city, :state, :street, :zip,
                  :location_name, :activity_name
  # , :lat, :lon

    def address
      [street, city, state, zip].compact.join(', ')
    end

    geocoded_by :address,
            :latitude => :lat, :longitude => :lon
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
