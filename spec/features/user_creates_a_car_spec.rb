require 'rails_helper'

feature 'user can add a new car', %Q(

  As a Car dealer
  I want to add to a new car for sale
  so that I can sell them

) do

  scenario 'user adds a new car' do
    car = FactoryGirl.build(:car)
    manufacturer = FactoryGirl.build(:manufacturer)

    visit new_manufacturer_path
    fill_in "Name", with: manufacturer.name
    select manufacturer.country, from: "Country"
    click_button "Create Manufacturer"

    visit new_car_path
    fill_in "Name", with: car.name
    select manufacturer.name, from: "Manufacturer"
    fill_in "Year", with: car.year
    fill_in "Color", with: car.color
    fill_in "Mileage", with: car.mileage
    fill_in "Description", with: car.description
    click_button "Create Car"

    expect(page).to have_content("Successfully Created!")
  end
end
