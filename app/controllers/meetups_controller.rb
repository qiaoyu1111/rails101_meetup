class MeetupsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :find_group_and_check_permission, only: [:edit, :update, :destroy]

  def index
    @meetups = Meetup.all
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

  def edit
  end

  def new
    @meetup = Meetup.new
  end

  def update
    if  @meetup.update(meetup_params)
      redirect_to meetups_path, natice: "Update success ."
    else
      render :edit
    end
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.user = current_user
    if @meetup.save
      redirect_to meetups_path, notice: "Create success ."
    else
      render :new
    end
  end

  def destroy
    @meetup.destroy
    redirect_to meetups_path, alert: "Meetup deleted ."
  end

  def find_group_and_check_permission
    @group = Group.find(params[:id])

    if current_user != @group.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

  private

  def meetup_params
    params.require(:meetup).permit(:title, :description)
  end
end
