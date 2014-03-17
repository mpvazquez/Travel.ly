class CreatePlace < ActiveRecord::Migration
  def change
    create_table :places do |t|
    	t.string :city
    	t.string :state
    	t.string :country
    	t.float :latitude
    	t.float :longitude
    	t.string :google_id
    	t.text :photo_url
    	t.text :description

    	t.timestamps
    end
  end
end
