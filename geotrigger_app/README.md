# Intro OAuth 1
## A Twitter Intro


## Client Setup

Let's setup you `client` in your `user` model.


```ruby

class ActiveRecord < ActiveRecord::Base

  @@confirm_url = "/oauth/callback"

  def self.setup(&block)
    @client = TwitterOAuth::Client.new(
        :consumer_key => ENV['CONSUMER_KEY'],
        :consumer_secret => ENV['CONSUMER_SECRET']
    )
    @request_token = client.request_token(:oauth_callback => @@confirm_url)
    yield @request_token.authorize_url, @request_token
  end

  def self.twitter_authorize(verifier)
    @access_token = @client.authorize(
      @request_token.token,
      @request_token.secret,
      verifier: verifier
    )

    @client.authorized?
    create({
      access_token: access_token.token,
      access_secret: access_token.secret
    })
  end
end

```


```
  
class SessionsController < ApplicationController

  def twitter_connect
    User.setup do |request_url|
      redirect_to request_url
    end
  end

  def twitter_callback
  end

end



```
