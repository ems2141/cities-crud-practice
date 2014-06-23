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

  scenario 'user can edit and update a city' do
    City.create!(name: "Denver")
    visit '/cities'
    click_on "Denver"
    click_on "Edit"

    fill_in 'Name', with: 'Fort Collins'
    click_on 'Update City'

    expect(page).to have_content 'Fort Collins'
    expect(page).to have_no_content 'Denver'
  end

  scenario 'user can delete a city' do
    City.create!(name: "Denver")
    visit '/cities'
    click_on "Denver"
    click_on 'Delete'

    expect(page).to have_no_content 'Denver!'
  end
end