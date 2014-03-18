FactoryGirl.define do
  factory :entry do
    association :stop, factory: :stop, strategy: :build
    text "I have returned"
    title "I have returned"
  end
end