# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    name "Mercedes Benz"
    year 2014
    description "MyText"
    color "Black"
    mileage 1
  end
end
