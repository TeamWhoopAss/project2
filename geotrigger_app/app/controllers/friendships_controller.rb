class FriendshipsController < ApplicationController

	def index
	end

	def new
	end

	def create
	  @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
	  @friendship.save
	  redirect_to user_path(current_user)
	end

	def show
		@friendship = Friendship.all
	end

	def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
    end

end
