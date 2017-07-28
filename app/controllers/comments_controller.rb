class CommentsController < ApplicationController

  def create
    @meetup = Meetup.find(params[:meetup_id])
    @comment = @meetup.comments.create(params[:comment].permit(:body))
    redirect_to meetup_path(@meetup)
  end

  def destroy
    @meetup = Meetup.find(params[:meetup_id])
    @comment = @meetup.comments.find(params[:id])
    @comment.destroy

    redirect_to meetup_path(@meetup)
  end
end
