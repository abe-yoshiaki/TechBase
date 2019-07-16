# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    if params[:comments].blank?
      # JSで入力エラー表示
    else
      @comments = Comment.create(comments: comment_params[:comments], tweet_id: comment_params[:tweet_id], user_id: current_user.id)
      redirect_to tweet_path(params[:tweet_id])
    end
  end

  private

  def comment_params
    params.permit(:comments, :tweet_id)
  end
end
