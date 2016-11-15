require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      cat = Category.create!(name: 'some_category')
      @product1 = cat.products.create!(name: 'some_name_1', description: 'some_description_1', image: 'some_image_1', price: 99.99, quantity: 10)
      @product2 = cat.products.create!(name: 'some_name_2', description: 'some_description_2', image: 'some_image_2', price: 199.99, quantity: 100)
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(email: 'kvirani@gmail.com', total_cents: 99999, stripe_charge_id: 'ch_19FypUCmD9JbuVBF0LQSKzXJ')
      # 2. build line items on @order
      @order.line_items.new(product: @product1, quantity: 1, item_price: 5, total_price: 5)
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(9)
      # expect(@product2.quantity).to eq(100)
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(email: 'kvirani@gmail.com', total_cents: 99999, stripe_charge_id: 'ch_19FypUCmD9JbuVBF0LQSKzXJ')
      # 2. build line items on @order
      @order.line_items.new(product: @product1, quantity: 1, item_price: 5, total_price: 5)
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      # expect(@product1.quantity).to eq(9)
      expect(@product2.quantity).to eq(100)
    end
  end
end

# create_table "orders", force: :cascade do |t|
#   t.integer  "total_cents"
#   t.datetime "created_at",       null: false
#   t.datetime "updated_at",       null: false
#   t.string   "stripe_charge_id"
#   t.string   "email"
# end
