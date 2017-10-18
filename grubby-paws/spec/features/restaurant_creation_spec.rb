require 'rails_helper'

RSpec.describe 'can see landing page' do
  it 'can see landing page at root' do
    visit('/')
    expect(page).to have_content "GRUBBY PAWS"
  end
end

RSpec.describe 'can add restaurant to page' do
  it 'can see restaurant name on page after adding' do
    visit('restaurants/new')
    fill_in "restaurant_name", with: 'Nigerian', visible: false
    fill_in "restaurant_description", with: 'Great'
    fill_in "restaurant_location", with: 'Home'
    click_button 'Create Restaurant'
    expect(page).to have_content "Nigerian"
  end
end

RSpec.describe 'can add restaurant description and visit single view page' do
  it 'can see restaurant description on page after adding' do
    visit('restaurants/new')
    fill_in "restaurant_name", with: 'Nigerian', visible: false
    fill_in "restaurant_description", with: 'Great place to eat!!!'
    fill_in "restaurant_location", with: 'Home'
    click_button 'Create Restaurant'
    click_link 'Nigerian'
    expect(page).to have_content 'Nigerian'
    expect(page).to have_content 'Great place to eat!!!'
  end
end

RSpec.describe 'can delete restaurant' do
  it 'can delete restaurant and not see it on main page' do
    visit('restaurants/new')
    puts page.body
    fill_in "restaurant_name", with: 'Nigerian', visible: false
    fill_in "restaurant_description", with: 'Great place to eat!!!'
    fill_in "restaurant_location", with: 'Home'
    click_button 'Create Restaurant'
    click_link 'Nigerian'
    click_link 'DELETE'
    expect(page).to_not have_content 'Nigerian'
  end
end

RSpec.describe 'can edit restaurant description' do
  it 'can edit restaurant description and see changes on page' do
    visit('restaurants/new')
    fill_in "restaurant_name", with: 'Nigerian', visible: false
    fill_in "restaurant_description", with: 'Great place to eat!!!'
    fill_in "restaurant_location", with: 'Home'
    click_button 'Create Restaurant'
    click_link 'Nigerian'
    click_link 'EDIT'
    fill_in "restaurant_description", with: 'Great place to eat again!!!'
    click_button 'Update Restaurant'
    expect(page).to_not have_content 'Great place to eat!!!'
    expect(page).to have_content 'Great place to eat again!!!'
  end
end
