class PhotosController < ApplicationController

before_action :authenticate_user!

  def new
    @race = Race.find(params[:race_id])
    @photos = Photo.where(race_id: @race.id)
    @photo = Photo.new(race_id: @race.id)
    authorize @photo

  end

  def manage
    authorize @photo
    @organisation = Organisation.find_by(user_id: current_user.id)
    @race = Race.find(params[:race_id])
    @photos = Photo.where(race_id: @race.id)
    @photo = Photo.new
  end

  def create
  if params[:photo]
      @photo = Photo.new(photo_params)
      @race = Race.find(params[:race_id])
      @photo.race_id = @race.id
      authorize @photo
      if @photo.save
        redirect_to new_race_photo_path
      else
        flash[:alert] = "There are some problem on the Upload. Please try Again"
        redirect_to new_race_photo_path
      end
    else
      flash[:alert] = "Select a photo clicking on the button Upload"
      redirect_to new_race_photo_path

    end

  end

  def destroy
    @photo = Photo.find(params[:id])
    @race = Race.find(@photo.race_id)
    authorize @photo
    @photo.delete
    redirect_to new_race_photo_path(@race.id)
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end

end
