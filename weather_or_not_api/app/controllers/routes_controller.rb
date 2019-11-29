class RoutesController < ApplicationController
  before_action :get_all_routes, only: [:index, :destroy]
  before_action :find_route_by_id, only: [:show, :update, :destroy]

  def index
    render json: @routes 
  end

  def show 
    render json: @route
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      render json: @route 
    else
      render json: error.messages
    end
  end

  def update
    @route.update(route_params)
  end

  def destroy 
    @route.destroy 
    render json: @routes
  end

  private

  def fetch_weather_data(lat, long)
    "https://api.darksky.net/forecast/#{../config/dark_sky.key}/#{lat},#{long}"
  end

  def get_all_routes
    @routes = Route.all
  end

  def find_route_by_id
    @route = Route.find(params[:id])
  end

  def route_params 
    params.require(:route).permit(:origin, :destination, :weather, :departure, :arrival)
  end

end
