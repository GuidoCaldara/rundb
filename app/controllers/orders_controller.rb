class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @race = Race.find(params[:race_id])
    @order  = Order.create!(race_sku: @race.sku, amount: @race.fee, state: "pending", user_id: current_user.id, race_id: @race.id)
     redirect_to new_order_payment_path(@order.id)
  end

 def destroy
    @order = Order.find(params[:id])
    @order.delete
    redirect_to profile_path(current_user.id)
 end

end
