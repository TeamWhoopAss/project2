class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      # below are the foreign keys linking friends to the user table
      t.integer :user_id
      t.integer :friend_id

      t.timestamps null: false
    end
  end
end
