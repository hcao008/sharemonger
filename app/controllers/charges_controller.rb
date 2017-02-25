class ChargesController < ApplicationController
  require "stripe"

  def new
  end

  def create
    # Amount in cents

#    @amount = 500
#     customer = Stripe::Customer.create(
#       :email => params[:stripeEmail],
#       :source  => params[:stripeToken]
#     )
#
#     charge = Stripe::Charge.create(
#       :customer    => customer.id,
#       :amount      => @amount,
#       :description => 'Rails Stripe customer',
#       :currency    => 'usd'
#     )
#
#   rescue Stripe::CardError => e
#     flash[:error] = e.message
#     redirect_to new_charge_path
#   end
# end

def create
   subscription = Stripe::Plan.create(
     :amount => (params[:amount].to_i)*100,
     :interval => params[:interval],
     :name => params[:name],
     :currency => 'usd',
     :trial_plan => null
     :id => SecureRandom.uuid # This ensures that the plan is unique in stripe
   )
   #Save the response to your DB
   flash[:notice] = "Plan successfully created"
   redirect_to '/subscription'
 end
end
