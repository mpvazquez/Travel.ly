class Place < ActiveRecord::Base

	has_many :trips, through: :stops
	has_many :stops

	validates :city, :state, :country, :latitude, :longitude, :google_id, :photo_url, :description, presence: true
  validates :google_id, uniqueness: true

end