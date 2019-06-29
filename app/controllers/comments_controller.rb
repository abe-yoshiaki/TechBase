class CommentsController < ApplicationController
  def create
    @comments = Comment.create(comments: comment_params[:comments], tweet_id: comment_params[:tweet_id], user_id: current_user.id)
    redirect_to tweet_path(params[:tweet_id])
  end

  private
  def comment_params
    params.permit(:comments, :tweet_id)
  end
end
