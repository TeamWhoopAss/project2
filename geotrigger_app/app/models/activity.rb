class Activity < ActiveRecord::Base
	has_one :friend, :through => :friendship
	has_one :user, :through => :friendship
end
