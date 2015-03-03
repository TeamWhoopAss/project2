class CreateGenerators < ActiveRecord::Migration
  def change
    create_table :generators do |t|
      t.text :json

      t.timestamps null: false
    end
  end
end
