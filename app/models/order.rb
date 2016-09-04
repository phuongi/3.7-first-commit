class Order < ApplicationRecord
  attr_accessor :user_id, :product_id, :total
  belongs_to :product
end