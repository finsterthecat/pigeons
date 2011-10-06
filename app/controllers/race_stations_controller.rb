class RaceStationsController < ApplicationController
  def index
    @race_stations = RaceStation.all
  end

  def show
    @race_station = RaceStation.find(params[:id])
    session[:current_race_station_id] = params[:id]
  end

  def new
    @race_station = RaceStation.new
  end

  def edit
    @race_station = RaceStation.find(params[:id])
  end

  def create
    @race_station = RaceStation.new(params[:race_station])
    if @race_station.save
      redirect_to @race_station, :notice => "Race Station was successfully created."
    else
      render :actin => "new"
    end
  end

  def update
    @race_station = RaceStation.find(params[:id])
    if @race_station.update_attributes(params[:race_station])
      redirect_to(@race_station, :notice => "Race Station was successfully updated.")
    else
      render :action => "edit"
    end
  end

  def destroy
    @race_station = RaceStation.find(params[:id])
    @race_station.destroy
    redirect_to(race_stations_url)
  end

  def update_distances
    @race_station = RaceStation.find(params[:id])
    distances = params[:race_station][:race_distances]
    distances.each do |d|
      @race_station.update_race_distance(d[:loft_id], d[:distance_meters])
    end
    redirect_to @race_station, :notice => "Distances successfully updated."
  end

end
