class User < ActiveRecord::Base

  def client
    @client ||= TwitterOAuth::Client.new(
      :consumer_key => ENV['CONSUMER_KEY'],
      :consumer_secret => ENV['CONSUMER_SECRET'],
      :token => access_token,
      :secret => access_secret
    )
  end

end