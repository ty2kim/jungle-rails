require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'is valid with all four fields' do
      @category = Category.create(name: 'new category')
      product = @category.products.create(name: 'some name', description: 'some description', image: 'some_img.jpg', price: 10, quantity: 10)
      puts "Error: #{product.errors.full_messages}"
      expect(product).to be_valid
    end
    it 'is not valid without a name' do
      @category = Category.create(name: 'new category')
      product = @category.products.create(description: 'some description', image: 'some_img.jpg', price: 10, quantity: 10)
      puts "Error: #{product.errors.full_messages}"
      # product.valid?.should be_true
      expect(product).not_to be_valid
    end
    it 'is now valid without a price' do
      @category = Category.create(name: 'new category')
      product = @category.products.create(name: 'some name', description: 'some description', image: 'some_img.jpg', quantity: 10)
      puts "Error: #{product.errors.full_messages}"
      # product.valid?.should be_true
      expect(product).not_to be_valid
    end
    it 'is not valid without a quantity' do
      @category = Category.create(name: 'new category')
      product = @category.products.create(name: 'some name', description: 'some description', image: 'some_img.jpg', price: 10)
      puts "Error: #{product.errors.full_messages}"
      # product.valid?.should be_true
      expect(product).not_to be_valid
    end
    it 'is not valid without a category' do
      # @category = Category.create(name: 'new category')
      product = Product.create(name: 'some name', description: 'some description', image: 'some_img.jpg', price: 10, quantity: 10)
      puts "Error: #{product.errors.full_messages}"
      # product.valid?.should be_true
      expect(product).not_to be_valid
    end
  end
end

# create_table "products", force: :cascade do |t|
#   t.string   "name"
#   t.text     "description"
#   t.string   "image"
#   t.integer  "price_cents"
#   t.integer  "quantity"
#   t.datetime "created_at",  null: false
#   t.datetime "updated_at",  null: false
#   t.integer  "category_id"
# end
