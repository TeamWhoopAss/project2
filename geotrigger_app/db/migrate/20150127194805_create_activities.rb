class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :tag
      t.string :name
      t.text :description
      t.string :full_street_address
      t.float :latitude
      t.float :longitude
      t.datetime :time_created
      t.datetime :expiry

      t.timestamps null: false
    end
  end
end
