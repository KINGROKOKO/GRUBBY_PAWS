RSpec.feature "can see landing page" do
  scenario "can see langing at root" do
    visit('/')
    expect(page).to have_content('GRUBBY PAWS')
  end
end
