class RoutesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new
    @race = Race.find(params[:race_id])
    session[:race_id] = @race.id
    @contition = false
  end

  def callback
    @condition = true
    @race = Race.find(session[:race_id])
    @auth = StravaAuth.new(params[:code])
    render :new
  end

  def create
    @race = Race.find(params[:race_id])
    @route = Route.new
    @route.pathfile = params[:array]
    @route.race = @race
    @route.save
    alert[:success] ="The track has been successfully uploaded!"
    redirect_to race_path(@race.id)
  end

  def destroy
    @route = Route.find(params[:id])
    @race = Race.find(@route.race_id)
    @route.delete
    redirect_to new_race_route_path(@race.id)
  end
end
