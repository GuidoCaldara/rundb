class RoutesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  before_action :authenticate_user!

  def new
    @race = Race.find(params[:race_id])
    session[:race_id] = @race.id
    @contition = false
    @route = Route.new(race_id: @race.id)
    authorize @route
  end

  def callback
    @condition = true
    @race = Race.find(session[:race_id])
    @auth = StravaAuth.new(params[:code])
    @route = Route.new(race_id: @race.id)
    authorize @route
    render :new
  end

  def show
    @race = Race.find(params[:race_id])
    @route = Route.find_by(race_id: @race)
    authorize @route
  end

  def create
    @race = Race.find(params[:race_id])
    @route = Route.new(race_id: @race.id)
    authorize @route
    @route.pathfile = params[:array]
    @route.save
    alert[:success] ="The track has been successfully uploaded!"
    redirect_to race_path(@race)
  end

  def destroy
    @route = Route.find(params[:id])
    @race = Race.find(@route.race_id)
    authorize @route
    @route.delete
    redirect_to new_race_route_path(@race.id)
  end
end
