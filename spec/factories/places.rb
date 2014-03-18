FactoryGirl.define do
  factory :place do
    city { Faker::Address.city }
    state { Faker::Address.neighborhood }
    country { Faker::Address.country }
    latitude { Faker::Geolocation.lat }
    longitude { Faker::Geolocation.lng }
    google_id { rand(3) * 400 }
    description { Faker::HipsterIpsum.sentence }
    photo_url "http://placekitten.com/200/200"
  end
end
