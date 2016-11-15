require 'rails_helper'

# feature => describe
# scenario => it
RSpec.feature "Visitor navigates to Add to Cart button", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see cart increases by one" do
    # ACT
    visit root_path
    click_link 'Add', match: :first
    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_text 'My Cart (1)'
  end
end
