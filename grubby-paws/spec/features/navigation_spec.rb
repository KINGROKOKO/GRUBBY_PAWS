require 'rails_helper'

RSpec.describe 'can click ADD RESTAURANT link' do
  it 'can click ADD RESTAURANT link and go to NEW RESTAURANT page' do
    visit('/')
    click_link 'ADD RESTAURANT'
    expect(page).to have_content "NEW RESTAURANT"
  end
end

RSpec.describe 'can click VIEW RESTAURANT link' do
  it 'can click VIEW RESTAURANT link and go to main page' do
    visit('restaurants/new')
    click_link 'VIEW RESTAURANTS'
    expect(page).to have_content "GRUBBY PAWS"
  end
end
