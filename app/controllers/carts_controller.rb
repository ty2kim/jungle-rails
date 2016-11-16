# class CartsController
class CartsController < ApplicationController
  before_action :find_product, only: [:add_item]

  def show
  end

  def add_item
    product_id = params[:product_id].to_s
    # cart is a helper method inherited from ApplicationController
    item = cart[product_id] || { 'quantity' => 0 }

    if @product && (@product.quantity > item['quantity'])
      item['quantity'] += 1
      cart[product_id] = item
      update_cart cart
    end
    redirect_to :back
  end

  def remove_item
    product_id = params[:product_id].to_s

    item = cart[product_id] || { 'quantity' => 1 }
    item['quantity'] -= 1
    cart[product_id] = item
    cart.delete(product_id) if item['quantity'] < 1
    update_cart cart

    redirect_to :back
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end
end
