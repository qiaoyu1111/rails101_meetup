class MeetupsController < ApplicationController
  before_action :authenticate_user! , only: [:new]
  
  def index
    @meetups = Meetup.all
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

  def edit
    @meetup = Meetup.find(params[:id])
  end

  def new
    @meetup = Meetup.new
  end

  def update
    @meetup = Meetup.find(params[:id])
    if  @meetup.update(meetup_params)
      redirect_to meetups_path, natice: "Update success ."
    else
      render :edit
    end
  end

  def create
    @meetup = Meetup.new(meetup_params)
    if @meetup.save
      redirect_to meetups_path, notice: "Create success ."
    else
      render :new
    end
  end

  def destroy
    @meetup = Meetup.find(params[:id])
    @meetup.destroy
    redirect_to meetups_path, alert: "Meetup deleted ."
  end

  private

  def meetup_params
    params.require(:meetup).permit(:title, :description)
  end
end
