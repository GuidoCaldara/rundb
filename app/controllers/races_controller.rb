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
  @race._geoloc = { “lat”: 41.1078251, “lng”: 16.6910569}
 @race.date_stamp = @race.date.to_time.to_i
 @race.organisation_id = @organisation.id
 if @race.save
  redirect_to new_race_photo_path(@race.id)
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
 if self.has_order?
  redirect_to race_path(@race.id)
else
  @race.destroy
  redirect_to root_path
end
end

private




def set_race
  @race = Race.find(params[:id])
end

def race_params
  params.require(:race).permit(:starting_point, :name, :distance, :elevation, :date, :category, :location, :latitude, :longitude, :starting_time, :discount_fee_cents, :fee_cents, :discount_fee_finish, :subscription_start, :subscription_end, :photos, :goodies, :capacity, :description, :bookable,:website, :subscription_link, :organisation_id, :first_edition)
end

end
