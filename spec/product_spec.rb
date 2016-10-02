require 'rails_helper'
describe Product do


before do
  @product = Product.create!(name: "Mountain Bikes")
end

before do
  @user = User.create!(email: "felix@gmail.com", password: "felix")
end

it "returns the average rating of all comments" do
end

end

@product.comments.new(rating: 1, user: @user, body: "Awful bike!")

