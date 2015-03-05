class UsersController < ApplicationController
  # before_action :logged_in?, only: [:show]

	def index
		@users = User.all
		@activities = Activity.all
		@geojson = Array.new

		@activities.each do |activity|
			@geojson << {
				type: 'Feature',
				geometry: {
					type: 'Point',
					coordinates: [activity.longitude, activity.latitude]
				},
				properties: {
					activity_description: activity.activity_description,
					address: activity.street,
					:'marker-color' => '#00607d',
					:'marker-symbol' => 'circle',
					:'marker-size' => 'medium'
				}
			}
		end
		
		respond_to do |format|
			format.html
			# responds w/ the geojson obj created
			format.json { render json: @geojson }
		end
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
		#raise session[:user_id].inspect
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
