class ClubsController < ApplicationController
  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])
    session[:current_club_id] = params[:id]
  end

  def new
    @club = Club.new
  end

  def edit
    @club = Club.find(params[:id])
  end

  def create
    @club = Club.new(params[:club])
    if @club.save
      redirect_to @club, :notice => "Club was successfully created."
    else
      render :action => "new"
    end
  end

  def update
    @club = Club.find(params[:id])
    if (@club.update_attributes(params[:club]))
      redirect_to(@club, :notice => "Club was successfully updated.")
    else
      render :action => "edit"
    end
  end

  def destroy
    @club = Club.find(params[:id])
    @club.destroy
    redirect_to(clubs_url)
  end

end
