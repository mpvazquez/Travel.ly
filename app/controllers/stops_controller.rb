require 'addressable/uri'

class StopsController < ApplicationController
	
	# POST /trips/:trip_id/stops
	def create
    binding.pry
		@place = Place.find_by(google_id: params[:google_id])

		unless @place.present?
			@place = Place.new({
				city: params[:city], 
				state: params[:state], 
				country: params[:country], 
				latitude: params[:latitude], 
				longitude: params[:longitude], 
				google_id: params[:google_id]
			})
			@place.photo_url = find_city_photo(@place.latitude, @place.longitude)
			@place.description = find_location("#{@place.city, @place.country}")
			@place.save
		end

		@trip = Trip.find_by(id: params[:trip_id])

		@trip.stops.create(place: @place)
	end

	def find_city_photo(latitude, longitude)

		results = flickr.places.findByLatLon(:lat => latitude, :lon => longitude)  
		place_id = results[0]["place_id"]
		photo_array = flickr.photos.search(:place_id => place_id, :tags => 'landmark', :sort => 'interestingness-desc')
		photo_id = photo_array[0]["id"]
		info = flickr.photos.getInfo(:photo_id => photo_id)  
		url = FlickRaw.url_b(info)  

		return url
	end

	def find_location(location)
    url = Addressable::URI.parse('https://www.googleapis.com/freebase/v1/search')
    url.query_values = {
      query: location,
      type: "/location/location"
        }
    from_freebase = HTTParty.get(url, :format => :json)
    mid = from_freebase["result"][0]["mid"]
    description = HTTParty.get("https://www.googleapis.com/freebase/v1/topic#{mid}?filter=/common/topic/description", :format => :json)

    return description["property"]["/common/topic/description"]["values"][0]["value"]
  end
end