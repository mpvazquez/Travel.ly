class StopsController < ApplicationController
	def create

		

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
end