class MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all
  end

  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.save
    redirect_to meetups_path, notice: "Create success ."
  end

  private

  def meetup_params
    params.require(:meetup).permit(:title, :description)
  end
end
