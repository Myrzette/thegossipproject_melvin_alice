class CitiesController < ApplicationController

  def show
    @c = City.find(params[:id])
    @city_users = User.where(city_id: params[:id])
  end
end
