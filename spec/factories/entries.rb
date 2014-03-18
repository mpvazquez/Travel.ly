FactoryGirl.define do
  factory :entry do
    association :stop, factory: :stop, strategy: :build
    text
  end
end