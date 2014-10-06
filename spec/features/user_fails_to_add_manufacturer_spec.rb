require 'rails_helper'

feature 'user receives error messages when he or she
does not fill in the form properly',

%Q(

  As a Car dealer
  I want to add to a list of manufacturers
  so that that I can organize the cars that I am selling
  by manufacturer

) do

  scenario 'user adds comic book' do

    visit new_manufacturer_path

    click_button "Create Manufacturer"

    expect(page).to have_content("Could Not Save")
    expect_presence_error_for(:name)
    expect_presence_error_for(:country)
  end
end

def expect_presence_error_for(attribute)
  within ".input.manufacturer_#{attribute.to_s}" do
    expect(page).to have_content "can't be blank"
  end
end
