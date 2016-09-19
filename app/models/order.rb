class Order < ActiveRecord::Base
  attr_accessor :user_id, :product_id, :total
  belongs_to :product
  belongs_to :user
end