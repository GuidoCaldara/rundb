class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def race_subscriptions
    @race = Race.find(params[:id])
    @orders = Order.where(race_id: @race.id).where(state: "paid")
  end

  def new
    @race = Race.find(params[:race_id])
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @race = Race.find(@order.race_id)
  end


  def create
    @race = Race.find(params[:race_id])
    @order = Order.create!(user_id: current_user.id, race_id: @race.id)
    @order.race_sku = @race.sku
    @order.state = "pending"
    if @race.discount_fee_cents
     if @race.discount_fee_finish >= Date.today
      @order.amount_cents = @race.discount_fee_cents
      @order.save!
    else
      @order.amount_cents = @race.fee_cents
      @order.save!
    end
  else
    @order.amount_cents = @race.fee_cents
    @order.save!
  end
  @order.update(order_params)
  redirect_to new_order_payment_path(@order.id)
end



def destroy
  @order = Order.find(params[:id])
  @order.delete
  redirect_to profile_path(current_user.id)
end

private

def order_params
  params.require(:order).permit(:first_name, :last_name, :group, :gender, :city, :date_of_birth)
end

end
