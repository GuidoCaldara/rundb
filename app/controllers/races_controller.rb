class RacesController < ApplicationController
 before_action :set_race, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_user!, except: [:index, :show]

  def index
    @races = policy_scope(Race)
  end

  def new
    @organisation = Organisation.find(current_user.organisation.id)
    @race = Race.new(organisation_id: @organisation.id)
    authorize @race
  end

  def create
    @race = Race.new(race_params)
    authorize @race
    @organisation = Organisation.find_by(user_id: current_user)
    #Set a random geoloc to avoid algolia crash if google geoloc doesn't work
    @race._geoloc = { "lat": 41.1078251, "lng": 16.6910569}
    #Set datestamp for algolia
    @race.date_stamp = (@race.date.to_time.to_i) * 1000
    #Set organisation id
    @race.organisation_id = @organisation.id
    if @race.save && @race.longitude && @race.latitude
      #update _geoloc for algolia if google geoloc is present
      @race._geoloc = { "lat": @race.latitude, "lng": @race.longitude}
      @race.save
      redirect_to new_race_photo_path(@race.id)
    elsif @race.save
      redirect_to new_race_photo_path(@race.id)
      flash[:alert] = "Problem while saving the location of the race. Please update it from the edit race page"
    else
      render action: 'new'
      flash[:alert] = "Problem while saving the race. Please try again"

    end
  end

  def show
    @organizer = Organisation.find(@race.organisation_id)
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
      render action: 'edit'
      flash[:alert] = "Problem while saving the race. Please try again"
    end
  end

  def destroy
    if @race.has_order?
      #Can't delete a photo with registration
      redirect_to race_path(@race.id)
        flash[:danger] = "You can't destroy a race that have already registration"
    else
      #delete all the photos of the race
      if @race.photos
        @race.photos.each do |photo|
        photo.destroy!
      end
      end
        #delete the route of the race
      if @race.route
        @race.route.destroy!
      end
      @race.destroy!
      redirect_to root_path
      flash[:success] = "the race has been successfully deleted from the database"
    end
  end


private

  def set_race
    @race = Race.find(params[:id])
    authorize @race
  end

  def race_params
    params.require(:race).permit(:photo, :pathimg, :starting_point, :name, :race_distance, :elevation, :date, :category, :location, :latitude, :longitude, :starting_time, :discount_fee_cents, :fee_cents, :discount_fee_finish, :subscription_start, :subscription_end, :photos, :goodies, :capacity, :description, :bookable,:website, :subscription_link, :organisation_id, :first_edition, :video)
  end

end
