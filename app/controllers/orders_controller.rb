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
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.race_id = @race.id
    @order.race_sku = @race.sku
    @order.state = "pending"
    byebug
    if @race.discount_fee_cents != 0
      if @race.discount_fee_finish >= Date.today
       @order.amount_cents = @race.discount_fee_cents
       if @order.save!
        redirect_to new_order_payment_path(@order.id)
      else
        render action: 'new'
      end
    else
      @order.amount_cents = @race.fee_cents
      if @order.save!
        redirect_to new_order_payment_path(@order.id)
      else
        render action: 'new'
      end
    end
  else
    @order.amount_cents = @race.fee_cents
    if @order.save
     redirect_to new_order_payment_path(@order.id)
    else
     render action: 'new'
    end
 end
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
