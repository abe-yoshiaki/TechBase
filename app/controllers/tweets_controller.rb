class TweetsController < ApplicationController
  # before_action :authenticate_user!

  def index
  end

  def home
  end

  def new
  end

  def create
    Tweet.create(content: tweet_params[:text], user_id: current_user.id)
  end

  private
  def tweet_params
    params.permit(:text)
  end
end
