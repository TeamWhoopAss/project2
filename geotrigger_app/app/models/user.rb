class User < ActiveRecord::Base

	has_secure_password
	has_one :activity
  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  

  # validates_confirmation_of :email
  # validates_presence_of :password_confirmation
  # validates_presence_of :email_confirmation

  # validates_uniqueness_of :email
  # validates_presence_of :email

  # geocoded_by :ip_address,

  #          :latitude => :lat, :longitude => :lon
  #after_validation :geocode

  def self.confirm(email_param, password_param)
    user = User.find_by({email: email_param})
    user.try(:authenticate, password_param)
  end

  # :latitude => :lat, :longitude => :lon
  # after_validation :geocode


  def search_results
  	results = Geocoder.search("Golden Gate Park, San Francisco, CA")
  	parse_results = JSON.parse(results)
  end


  def client
    @client ||= TwitterOAuth::Client.new(
      :consumer_key => ENV['CONSUMER_KEY'],
      :consumer_secret => ENV['CONSUMER_SECRET'],
      :token => access_token,
      :secret => access_secret
    )
  end


end
