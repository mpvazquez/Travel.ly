# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#clear database
Trip.delete_all
Place.delete_all
Stop.delete_all

#Let's go to Thailand!
trip = Trip.create(name: "Thailand Booze Cruise!")

#creating 20 places with fake data
20.times do
  rand_number = (1..10).to_a.sample
  Place.create(city: "#{Faker::Address.city}", state: "#{Faker::Address.neighborhood}", country: "#{Faker::Address.country}", latitude: "#{Faker::Geolocation.lat}", longitude: "#{Faker::Geolocation.lng}", google_id: "1a2b3c", photo_url: "http://placekitten.com/#{rand_number}00/#{rand_number}00", description: "#{Faker::HipsterIpsum.sentence}")
end

# i is a counter that helps create 5 stops. As google_id's are the same, we use this attribute to find an entry that has a relevant foreign id
i = 0
5.times do
  Stop.create(trip_id: trip.id, place_id: Place.where(google_id: "1a2b3c")[i].id)
  i += 1
end