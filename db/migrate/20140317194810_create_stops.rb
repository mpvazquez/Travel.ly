class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
    	t.references :trip
    	t.references :place
    end
  end
end
