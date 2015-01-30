class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :friend_id
      t.datetime :created_at
      t.datetime :expires_at
      t.float :lat
      t.float :lon
      t.text :location_name
      t.text :activity_tag
      t.text :activity_description
      t.binary :pin_accepted
      t.binary :pin_confirmed

      t.timestamps null: false
    end
  end
end
