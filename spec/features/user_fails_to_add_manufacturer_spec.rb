require 'rails_helper'

feature 'user receives error messages when he or she
does not fill in the form properly',

%Q(

  As a Car dealer
  I want to know when I failed to properly create a
  new manufacturer and what I did wrong
  so that I can correct my mistakes

) do

  scenario 'user improperly fills out the manufacturer form' do

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
