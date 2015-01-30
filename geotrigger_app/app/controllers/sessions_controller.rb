class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # user = User.confirm(*login_params)
    
  	user_params = params.require(:user)
  	user = User.confirm(user_params[:email], user_params[:password])
  	if user
  		login(user)
  		redirect_to user_path(user.id)
  	else
  		redirect_to "/login"
  	end
  end

  def destroy
  	logout()
  	redirect_to "/"
  end

  # def twitter_connect
  #   twitter_oauth_setup do |request_url, request_token|
  #     session[:request_token] = request_token
  #     redirect_to request_url
  #   end
  # end

  # def twitter_callback
  #   twitter_authorize(params) do |client, access_obj|
  #     client_info = client.info

  #     user = User.find_by({twitter_id: client_info["id"]})
  #     unless user
  #       user = User.create({
  #                           access_token: access_obj.token,
  #                           access_secret: access_obj.secret,
  #                           twitter_id: client_info["id"]
  #                         })
  #     else
  #       user.update({
  #                     access_token: access_obj.token,
  #                     access_secret: access_obj.secret
  #                   })
  #     end

  #     login(user)

  #     redirect_to users_path
  #   end
  # end

end
