class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.create!(:name => params[:city][:name])
    redirect_to cities_path
  end

  def show
    @city = City.find(params[:id])
  end
end