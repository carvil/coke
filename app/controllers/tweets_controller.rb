class TweetsController < ApplicationController

  respond_to :json, :html, :js

  def index
    @tweets = tweets_desc_sentiment
    respond_with @tweets
  end

  def load
    status = Tweet.load
    @error = "Something went wrong, please try again" unless status == :ok
    @tweets = tweets_desc_sentiment
    respond_with @tweets
  end

  private

  def tweets_desc_sentiment
    Tweet.desc(:sentiment)
  end
end
