# class Product
class Product < ActiveRecord::Base
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  # has_many :line_items
  # has_many :orders, through: :line_items
  # has_many :reviews
  # reviews will belong to product

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
end
