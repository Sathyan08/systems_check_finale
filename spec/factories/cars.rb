# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    name "MyString"
    manufacturer "MyString"
    year 1
    description "MyText"
    color "MyString"
    mileage 1
  end
end
