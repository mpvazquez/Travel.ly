FactoryGirl.define do
  factory :stop do
    association :place
    association :trip
  end
end