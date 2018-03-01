class RacesController < ApplicationController
   before_action :set_race, only: [:show, :edit, :update, :destroy]
  def index
    @races = Race.all
  end
  def new
    @race = Race.new
  end
  def create
    @race = Race.new(race_params)
    @organisation = Organisation.find_by(user_id: current_user)
    @race.organisation_id = @organisation.id
    @race.sku = sku_generator
    if @race.save
      redirect_to root_path
    else
      render action: 'new'
    end
  end
  def show
  end
  def edit
  end
  def update
   if @race.update(race_params)
    redirect_to race_path(@race.id)
  else
    render action: 'edit'
  end
end
  def destroy
   if has_order?(@race)
    redirect_to race_path(@race.id)
  else
    @race.destroy
    redirect_to race_path(@race.id)
  end
  end
private
  def has_order?(race)
    if Order.where(race_id: race.id)
       true
    else
       false
    end
  end
  def sku_generator
    (('0'..'9').to_a + ('0'..'9').to_a + ('0'..'9').to_a + ('0'..'9').to_a).sort_by { rand }.join[0...4]
  end
  def set_race
    @race = Race.find(params[:id])
  end
  def race_params
    params.require(:race).permit(:starting_point, :name, :distance, :elevation, :date, :category, :location, :latitude, :longitude, :starting_time, :discount_fee, :fee, :discount_fee_finish, :subscription_start, :subscription_end, :photos, :goodies, :capacity, :description, :bookable,:website, :subscription_link, :organisation_id, :first_edition)
  end
end
