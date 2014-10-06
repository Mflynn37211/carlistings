require 'rails_helper'

feature 'user adds a new car' do

  scenario 'user can add a car' do
    car = FactoryGirl.build(:car)

    visit new_car_path

    fill_in 'Model', with: car.model_name
    fill_in 'Mileage', with: car.mileage
    fill_in 'Color', with: car.color
    fill_in 'Year', with: car.year
    select(car.manufacturer.name, from: "Manufacturer")
    click_on 'Submit'

    expect(page).to have_content car.model_name
  end

  scenario 'user tries to add a blank car' do
    visit new_car_path
    click_on 'Submit'

    expect(page).to have_content "Model name can't be blank"
    expect(page).to have_content "Color can't be blank"
    expect(page).to have_content "Year can't be blank"
    expect(page).to have_content "Year is not a number"
    expect(page).to have_content "Mileage can't be blank"
  end

  scenario 'user adds a car with a year before 1920' do
    visit new_car_path

    fill_in 'Year', with: "1909"
    click_on 'Submit'

    expect(page).to have_content "Year must be greater than 1919"
  end

  scenario 'user adds a car with a year after current year' do
    visit new_car_path

    fill_in 'Year', with: "2016"
    click_on 'Submit'

    expect(page).to have_content "Year must be less than 2015"
  end

  scenario 'user tries to add a car with a milage with negative mileage' do
    visit new_car_path

    fill_in 'Mileage', with: "-1"
    click_on 'Submit'

    expect(page).to have_content "Mileage must be greater than -1"
  end
end
