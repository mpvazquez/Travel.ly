FactoryGirl.define do
  factory :entry do
    association :stop
    text "I have returned"
    title "I have returned"
  end
end