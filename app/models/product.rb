class Product < ApplicationRecord
  attr_accessor :user_id, :product_id, :total
  has_many :orders
end