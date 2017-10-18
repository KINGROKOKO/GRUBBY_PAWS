require 'rails_helper'

RSpec.describe 'User can sign up' do
  it 'User can sign up to site' do
    sign_up
    expect(page).to have_content "SIGN OUT"
  end
end

RSpec.describe 'User can sign in' do
  it 'User can sign in to site' do
    sign_up
    click_link 'SIGN OUT'
    click_link 'LOG IN'
    fill_in "Email", with: 'm@email.com', visible: false
    fill_in "user[password]", with: '1234567'
    click_button 'Log in'
    expect(page).to_not have_content "LOG IN"
    expect(page).to have_content "SIGN OUT"
  end
end

RSpec.describe 'User can sign out' do
  it 'User can sign out of site' do
    sign_up
    click_link 'SIGN OUT'
    click_link 'LOG IN'
    fill_in "Email", with: 'm@email.com', visible: false
    fill_in "user[password]", with: '1234567'
    click_button 'Log in'
    click_link 'SIGN OUT'
    expect(page).to_not have_content "SIGN OUT"
    expect(page).to have_content "LOG IN"
  end
end
