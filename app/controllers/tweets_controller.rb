class TweetsController < ApplicationController

  respond_to :json, :html, :js

  def index
    @tweets = tweets_desc_sentiment
    respond_with @tweets
  end

  def load
    # Need to check for errors and show message is anything is wrong
    Tweet.load
    @tweets = tweets_desc_sentiment
    respond_with @tweets
  end

  private

  def tweets_desc_sentiment
    Tweet.desc(:sentiment)
  end
end
