require 'rails_helper'

# feature => describe
# scenario => it
RSpec.feature 'Visitor navigates to home page', type: :feature, js: true do

  scenario 'They see all products' do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot
  end
end
