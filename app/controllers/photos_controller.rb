class PhotosController < ApplicationController


  def new
    @race = Race.find(params[:race_id])
    @photos = Photo.where(race_id: @race.id)
    @photo = Photo.new
  end

  def manage
    @organisation = Organisation.find_by(user_id: current_user.id)
    @race = Race.find(params[:race_id])
    @photos = Photo.where(race_id: @race.id)
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @race = Race.find(params[:race_id])
    @photo.race_id = @race.id
    if @photo.save
      redirect_to new_race_photo_path
    else
      render action: 'new'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.delete
    redirect_to new_race_photo_path
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end

end
