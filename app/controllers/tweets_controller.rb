class TweetsController < ApplicationController
  # before_action :move_to_index

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def home
    if user_signed_in?
      redirect_to tweets_path
    end
  end

  def new
  end

  def create
    Tweet.create(title: tweet_params[:title], content: tweet_params[:text], user_id: current_user.id)
    if tweet_params[:title].present? && tweet_params[:text].present?
      redirect_to action: :index
      flash[:post_done] = "JSのメッセージ表示用"
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  private
  def tweet_params
    params.permit(:title, :text)
  end
end
