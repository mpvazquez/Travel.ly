class Place < ActiveRecord::Base

	has_many :trips, through: :stops
	has_many :stops
  has_many :entries, through: :stops

	validates :city, :state, :country, :latitude, :longitude, :google_id, :photo_url, :description, presence: true

end