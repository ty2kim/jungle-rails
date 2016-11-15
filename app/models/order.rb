# class Order
class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  # below maybe not needed
  has_many :products, through: :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create :deduct_quantity_from_product

  private

  def deduct_quantity_from_product
    last_order_line_items = Order.last.line_items
    last_order_line_items.each do |item|
      deduct_num = item.quantity
      product = Product.find(item.product_id)
      result_quantity = product.quantity - deduct_num
      product.update(quantity: result_quantity)
    end
  end
end
