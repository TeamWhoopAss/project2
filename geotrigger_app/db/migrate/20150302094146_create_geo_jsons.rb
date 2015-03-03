class CreateGeoJsons < ActiveRecord::Migration
  def change
    create_table :geo_jsons do |t|
      t.text :geoJson

      t.timestamps null: false
    end
  end
end
