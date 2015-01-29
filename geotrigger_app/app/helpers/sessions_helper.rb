module SessionsHelper

	def login(user)
		session[:request_token] = nil
		session[:user_id] = user.id
		@current_user = user
	end

	def logout
		@current_user = session[:user_id] = nil
	end

	def logged_in?
		unless current_user != nil
			redirect_to login_path
		end
	end

	def current_user
		@current_user = @current_user || User.find_by(id: session[:user_id])
	end



### TWITTER SIGN IN LOGIC

	CONFIRM_URL = "http://localhost:3000/oauth/callback"

  def new_client
    @client ||= TwitterOAuth::Client.new(
        :consumer_key => ENV['CONSUMER_KEY'],
        :consumer_secret => ENV['CONSUMER_SECRET']
    )
  end

  def request_token
    @request_token ||= session[:request_token] 
    @request_token ||= new_client.request_token(:oauth_callback => CONFIRM_URL)
  end

  def twitter_oauth_setup(&block)
  	url = request_token.try(:authorize_url) || request_token["authorize_url"]
    yield  url, request_token
  end

  def twitter_authorize(params, &block)
    #raise params.inspect
    access_obj = new_client.authorize(
      request_token["token"],
      request_token["secret"],
      oauth_verifier: params[:oauth_verifier]
    )
    yield new_client, access_obj
  end

end
