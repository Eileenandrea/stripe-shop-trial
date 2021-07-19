class CheckoutController < ApplicationController

    def create
        @product = Product.find(params[:id])
        Stripe.api_key = Rails.application.credentials.stripe[:secret_key]
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],

            line_items: [{
                name: @product.id,
                amount: @product.price,
                currency: 'usd',
                quantity: 1,
            }],
            payment_intent_data: {
                metadata: {
                    product_id: @product.id,
                    price: @product.price
                }
            },
            mode: 'payment',
            success_url: root_url,
            cancel_url: root_url
          })

          respond_to do |format|
            format.js
            end
          
    end
    
end
