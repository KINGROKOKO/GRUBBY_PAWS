require 'rails_helper'

RSpec.describe 'can click ADD RESTAURANT link' do
  it 'can click ADD RESTAURANT link and go to NEW RESTAURANT page' do
    sign_up
    click_link "ADD RESTAURANT"
    expect(page).to have_content "NEW RESTAURANT"
  end
end

RSpec.describe 'can click VIEW RESTAURANT link' do
  it 'can click VIEW RESTAURANT link and go to main page' do
    sign_up
    click_link "ADD RESTAURANT"
    click_link 'Restaurant Review'
    expect(page).to have_content "GRUBBY PAWS"
  end
end
