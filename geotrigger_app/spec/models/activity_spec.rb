require 'rails_helper'

RSpec.describe Activity, :type => :model do
  
  describe "validate" do

    before(:context) do
      @first_params = {
                      name: "Beers at Moe's Tavern",
                      description: "Come have beers down at Moe's Tavern.  I'll buy you a pickled egg.",
                      full_street_address: "565 Waverly St.",
                      latitude: "56.83483",
                      longitude: "-89.23228",
                      time_created: "2015, 1, 27, 0, 0, 0, 0",
                      expiry: "2015, 1, 28, 0, 0, 0, 0",

                      }
      @first_activity = Activity.create(@first_params)
    end

    before(:example) do
      @valid_params = {
                      name: "Beers at Moe's Tavern",
                      description: "Come have beers down at Moe's Tavern.  I'll buy you a pickled egg.",
                      full_street_address: "565 Waverly St.",
                      latitude: "56.83483",
                      longitude: "-89.23228",
                      time_created: "2015, 1, 27, 0, 0, 0, 0",
                      expiry: "2015, 1, 28, 0, 0, 0, 0", 
                      }

    end

    after(:example) do
      User.last.destroy()
    end

    describe "name" do

     end








