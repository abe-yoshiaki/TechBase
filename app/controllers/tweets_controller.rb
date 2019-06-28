class TweetsController < ApplicationController
  # before_action :authenticate_user!

  def index
  end

  def home
  end

  def new
  end

  def create
<<<<<<< Updated upstream
    Tweet.create(content: tweet_params[:text], user_id: current_user.id)
=======
    Tweet.create(title: tweet_params[:title], content: tweet_params[:text], user_id: current_user.id)
    if tweet_params[:title].present? && tweet_params[:text].present?
      redirect_to action: :index
      flash[:notice] = "JSのメッセージ表示用"
    end
>>>>>>> Stashed changes
  end

  private
  def tweet_params
    params.permit(:text)
  end
end
