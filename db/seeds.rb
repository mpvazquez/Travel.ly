#clear database
Trip.delete_all
Place.delete_all
Stop.delete_all

#Let's go to Thailand!
trip = FactoryGirl.create(:trip, name: "Thailand Booze Cruise!")

#creating 20 places with fake data
20.times do
  FactoryGirl.create(:place)
end

5.times do
  Stop.create(trip: trip, place: Place.order("RANDOM()").first)
end