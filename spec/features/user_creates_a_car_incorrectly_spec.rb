require 'rails_helper'

feature 'user is given error messages when inputing car incorrectly', %Q(

  As a Car dealer
  I want to know why my car listing did not save
  so that I can feel bad about myself.
) do

  scenario 'user adds a new car incorrectly' do
    car = FactoryGirl.build(:car)
    manufacturer = FactoryGirl.build(:manufacturer)

    visit new_manufacturer_path
    fill_in "Name", with: manufacturer.name
    select manufacturer.country, from: "Country"
    click_button "Create Manufacturer"

    visit new_car_path
    select manufacturer.name, from: "Manufacturer"
    fill_in "Year", with: 1911
    fill_in "Description", with: car.description
    click_button "Create Car"

    expect(page).to have_content("Could Not Save")
    expect_presence_error_for_car(:name)
    expect_presence_error_for_car(:color)

    within ".input.car_mileage" do
      expect(page).to have_content "is not a number"
    end

    within ".input.car_year" do
      expect(page).to have_content "must be greater than 1920"
    end

  end
end

def expect_presence_error_for_car(attribute)
  within ".input.car_#{attribute.to_s}" do
    expect(page).to have_content "can't be blank"
  end
end

