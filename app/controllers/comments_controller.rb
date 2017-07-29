class CommentsController < ApplicationController
  def create
    @meetup = Meetup.find(params[:meetup_id])
    @comment = @meetup.comments.create(params[:comment].permit(:name, :body))
    redirect_to meetups_path, notice: "Create a new comment."
  end
end
