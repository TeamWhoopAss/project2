class Friendship < ActiveRecord::Base
	#first is the user who initiates, second is the user who is friended
	belongs_to :user
	belongs_to :friend, :class_name => 'User'
end
