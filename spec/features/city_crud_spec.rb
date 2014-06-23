require 'rails_helper'

feature 'CRUDing cities' do
  scenario 'it allows users to create a city' do
    visit '/'
    click_on 'Cities'

    click_on 'Add a City'
    fill_in 'Name', with: 'New York'
    click_on 'Submit'

    expect(page).to have_content 'New York'
  end

  scenario 'user can show a city' do
    City.create!(name: "Denver")
    visit '/cities'
    click_on "Denver"

    expect(page).to have_content 'This is Denver!'
  end
end