class TweetsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def home
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

  private
  def tweet_params
    params.permit(:title, :text)
  end
end
