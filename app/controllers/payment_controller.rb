class PaymentsController < ApplicationController
before_action :find_user_object
def create
    @product = Product.find(params[:product_id])
    @payment.user = current_user
    redirect_to @product
    # Create the charge on Stripe's servers - this will charge the user's card
  begin
    charge = Stripe::Charge.create(
      :amount => 1000, # amount in cents, again
      :currency => "Euro",
      :source => "http://careerfoundry.com/images/bike.jpg",
      :description => params[:stripeEmail]
    )
  end

    if charge.paid
      Order.create(:user_id, :product_id) 
    end
end

  rescue Stripe::CardError => e
    # The card has been declined
  end
end

