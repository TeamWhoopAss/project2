class ActivitiesController < ApplicationController

	def index
		@activities = Activity.all
	end

	def new
	end

	def create
		#raise request.remote_ip.inspect
		activity = params.require(:activity).permit(:lat, :lon, :location_name, :activity_tag, :activity_description)
		# activity[:ip_address] = request.remote_ip
		Activity.create(activity)
		redirect_to '/activities'		
	end

	def edit
		activity_id = params[:id]
		@activity = Activity.find(activity_id)
		render :edit
	end

	def update
		activity_id = params[:id]
		@activity = Activity.find(activity_id)
		@activity.update_attributes(params.require(:activity).permit(:location_name, :activity_tag, :activity_description))
		redirect_to activities_path
	end


	def destroy
		activity = Activity.find(params[:id])
		activity.try(:destroy)
		redirect_to '/activities'
	end

end

