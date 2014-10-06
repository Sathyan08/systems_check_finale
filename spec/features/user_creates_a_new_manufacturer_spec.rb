require 'rails_helper'

feature 'user can add a new manufacturer', %Q(

  As a Car dealer
  I want to add to a list of manufacturers
  so that that I can organize the cars that I am selling
  by manufacturer

) do

  scenario 'user adds comic book' do
    manufacturer = FactoryGirl.build(:manufacturer)

    visit new_manufacturer_path
    fill_in "Name", with: manufacturer.name
    select manufacturer.country, from: "Country"
    click_button "Create Manufacturer"

    expect(page).to have_content("Successfully Created!")
  end
end
