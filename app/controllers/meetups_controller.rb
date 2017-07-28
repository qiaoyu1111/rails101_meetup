class MeetupsController < ApplicationController
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
    @meetup.update(meetup_params)
    redirect_to meetups_path, natice: "Update success ."
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.save
    redirect_to meetups_path, notice: "Create success ."
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
