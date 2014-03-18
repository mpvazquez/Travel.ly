FactoryGirl.define do
  factory :place do
    city { Faker::Address.city }
    state { Faker::Address.neighborhood }
    country { Faker::Address.country }
    latitude { Faker::Geolocation.lat }
    longitude { Faker::Geolocation.lng }
    google_id { | n| "#{n}" }
    description { Faker::HipsterIpsum.sentence }
    photo_url do
      rand_num = (1..10).to_a.sample
      "http://placekitten.com/#{rand_num}00/#{rand_num}00"
    end
  end
end
