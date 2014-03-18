FactoryGirl.define do
  factory :stop do
    association :place, factory: :place, strategy: :build
    association :trip, factory: :trip, strategy: :build
  end
end