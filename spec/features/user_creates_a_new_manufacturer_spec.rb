require 'rails_helper'

feature 'user adds a new manufacturer' do
  scenario 'user can add a manufacturer' do
    manufacturer = FactoryGirl.build(:manufacturer)

    visit new_manufacturer_path
    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country
    click_on 'Add Manufacturer'

    expect(page).to have_content manufacturer.name
  end

  scenario 'user tries to add a blank manufacturer' do
    visit new_manufacturer_path

    click_on 'Add Manufacturer'
    expect(page).to have_content "Please insert information in both fields!"
  end
end
