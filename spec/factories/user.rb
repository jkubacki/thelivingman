# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    name 'user'
    password '$dage0$dJL4JFgU.zflSatge19Gn.YNJB6Zbj/p4BGE21PGNe/oju60OkXtu'
    email
  end
end