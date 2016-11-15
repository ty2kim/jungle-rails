require 'rails_helper'

# feature => describe
# scenario => it
RSpec.feature "Visitor logins", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create! first_name: 'Chris', last_name: 'C', email: 'chris@example.com', password: '1', password_confirmation: '1'
  end

  scenario "They are taken to the home page" do
    # ACT
    visit login_path
    fill_in 'email', with: 'chris@example.com'
    fill_in 'password', with: '1'
    find_button('Submit').click
    
    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css 'header.page-header'
  end
end
