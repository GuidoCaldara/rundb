class PagesController < ApplicationController
  # skip_before_action :authenticate_user!

  def home
    location_data = Geocoder.search(request.ip).first
    @nearby_races = Race.near([location_data.latitude, location_data.longitude], 15000)
  end

end
