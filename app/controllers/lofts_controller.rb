class LoftsController < ApplicationController
  def show
    @loft = Loft.find(params[:id])
  end

  def new
    @loft = Loft.new
  end

  def edit
    @loft = Loft.find(params[:id])
  end

  def create
    @loft = Loft.new(params[:loft])
    @loft.club = Club.find(session[:current_club_id])
    if @loft.save
      redirect_to @loft, :notice => "Loft was successfully created."
    else
      render :action => "new"
    end
  end

  def update
    @loft = Loft.find(params[:id])
    if (@loft.update_attributes(params[:loft]))
      redirect_to(@loft, :notice => "Loft was successfully updated.")
    else
      render :action => "edit"
    end
  end

  def destroy
    @loft = Loft.find(params[:id])
    @loft.destroy
    redirect_to(lofts_url)
  end
end
