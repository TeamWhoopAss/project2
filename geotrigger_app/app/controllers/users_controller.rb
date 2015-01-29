class UsersController < ApplicationController
  # before_action :logged_in?, only: [:show]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		login(@user)
		redirect_to user_path(@user.id)
	end

	def show
		@user = current_user
		@friends = current_user.friends
	end

	private

		def user_params
			params.require(:user).permit(:email, :email_confirmation, 
																	 :password, :password_confirmation)
		end

		def find_user
			@user = User.find(params[:id])
		end

		def destroy
			@user.destroy
		end

end
