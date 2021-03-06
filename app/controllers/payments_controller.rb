class PaymentsController < ApplicationController
  before_action :set_order

def new
  @race = Race.find(@order.race_id)
end

def create
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @order.amount_cents,
    description:  "Payment for race #{@order.race_sku} for order #{@order.id}",
    currency:     @order.amount.currency
  )

  @order.update(payment: charge.to_json, state: 'paid')
  redirect_to order_path(@order)

rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_order_payment_path(@order)
end

def show
  @order = Order.where(state: 'paid').find(params[:id])
end


private


  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end
end
