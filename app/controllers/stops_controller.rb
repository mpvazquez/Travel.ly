require 'addressable/uri'

class StopsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
  end

  def new
    @stop = Stop.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @place = Place.find_by(google_id: params[:google_id])

    unless @place.present?
      @place = Place.new({
        city: params[:city], 
        state: params[:state], 
        country: params[:country], 
        latitude: params[:latitude], 
        longitude: params[:longitude], 
        google_id: params[:google_id],  
      })
      @place.photo_url = find_city_photo("#{@place.city}, #{@place.country}", "#{@place.state}")
      @place.description = find_location("#{@place.city}, #{@place.country}")
      @place.save      
    end

    @trip = Trip.find_by(id: params[:trip_id])

    @trip.stops.create(place: @place)
    redirect_to trip_path(@trip)
  end

  def show
    @stop = Stop.find(params[:id])
  end

  private

  def find_city_photo(place, secondplace)
    result = flickr.places.find(:query => place)

    if result.length == 0
      result = flickr.places.find(:query => secondplace)
    end

    photo_array = retrieve_photos(result[0]["place_id"])

    if photo_array.length == 0
      result = flickr.places.find(:query => secondplace)
      photo_array = retrieve_photos(result[0]["place_id"])
    end

    photo_id = photo_array[0]["id"]
    info = flickr.photos.getInfo(:photo_id => photo_id)  
    url = FlickRaw.url(info)  

    return url 
  end

  def retrieve_photos(place_id)
    flickr.photos.search(:place_id => place_id, :tags => 'landmark', :sort => 'interestingness-desc')
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