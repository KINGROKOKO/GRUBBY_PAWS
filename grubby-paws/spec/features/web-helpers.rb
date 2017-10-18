def sign_up
  visit('/')
  click_link 'SIGN UP'
  fill_in "Email", with: 'm@email.com', visible: false
  fill_in "user[password]", with: '1234567'
  fill_in "user[password_confirmation]", with: '1234567'
  click_button 'Sign up'
end
