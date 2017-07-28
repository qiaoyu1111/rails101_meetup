class CommentsController < ApplicationController

  def create
    @meetup = Meetup.find(params[:meetup_id])
    @comment = @meetup.comments.create(params[:comment].permit(:body))
    redirect_to meetup_path(@meetup)
  end
end
