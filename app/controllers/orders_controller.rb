class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def race_subscriptions
    @race = Race.find(params[:id])
    @orders = Order.where(race_id: @race.id).where(state: "paid")
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end


  def create
    @race = Race.find(params[:race_id])
    if @race.discount_fee_cents && @race.discount_fee_finish > Date.today
      @order  = Order.create!(race_sku: @race.sku, amount: @race.discount_fee_cents, state: "pending", user_id: current_user.id, race_id: @race.id)
     redirect_to new_order_payment_path(@order.id)
    else
    @order  = Order.create!(race_sku: @race.sku, amount: @race.fee_cents, state: "pending", user_id: current_user.id, race_id: @race.id)
     redirect_to new_order_payment_path(@order.id)
    end
  end

 def destroy
    @order = Order.find(params[:id])
    @order.delete
    redirect_to profile_path(current_user.id)
 end

end
