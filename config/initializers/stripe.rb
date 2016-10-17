if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_aMAMOZnwmrYIWY5PQV32RN4d',
    :secret_key => 'sk_test_xThJORBh44CfVGVqPKPl91AR'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]