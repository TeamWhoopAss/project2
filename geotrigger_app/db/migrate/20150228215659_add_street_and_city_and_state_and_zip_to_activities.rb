class AddStreetAndCityAndStateAndZipToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :street, :string
    add_column :activities, :city, :string
    add_column :activities, :state, :string
    add_column :activities, :zip, :integer
  end
end
