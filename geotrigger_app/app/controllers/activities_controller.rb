class ActivitiesController < ApplicationController

	def index
		@activities = Activity.all
	end

	def new
	end

	def create
		activity = params.require(:activity).permit(:location_name, :activity_tag, :activity_description)
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

