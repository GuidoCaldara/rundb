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
 @race._geoloc = { "lat": 41.1078251, "lng": 16.6910569}
 @race.date_stamp = (@race.date.to_time.to_i) * 1000
 @race.organisation_id = @organisation.id
 if @race.save && @race.longitude && @race.latitude
  @race._geoloc = { "lat": @race.latitude, "lng": @race.longitude}
  @race.save
  redirect_to new_race_photo_path(@race.id)
 elsif @race.save
    redirect_to new_race_photo_path(@race.id)
    flash[:alert]
else
  render action: 'new'
end
end

def show
  @organizer = Organisation.find(@race.organisation_id)
  @race = Race.find(params[:id])
  @review = Review.new
  @reviews = @race.reviews
  @all_reviews = Review.all
end

def edit
end

def update
 if @race.update(race_params)
  redirect_to race_path(@race.id)
else
  render :edit
end
end

def destroy
 if self.has_order?
  redirect_to race_path(@race.id)
  flash[:danger] = "You can't destroy a race that have already registration"
else
  @race.destroy
  if @race.photos
  @race.photos.each do |photo|
    photo.destroy!
  end
  end
  redirect_to root_path
  flash[:success] = "the race has been successfully deleted from the database"
end
end


private

def set_race
  @race = Race.find(params[:id])
end

def race_params
  params.require(:race).permit(:photo, :starting_point, :name, :distance, :elevation, :date, :category, :location, :latitude, :longitude, :starting_time, :discount_fee_cents, :fee_cents, :discount_fee_finish, :subscription_start, :subscription_end, :photos, :goodies, :capacity, :description, :bookable,:website, :subscription_link, :organisation_id, :first_edition, :video)
end

end
