# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :character do
    name "Character name"
    exp 100
    user
    campaign
  end
end
