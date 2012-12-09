class TweetsController < ApplicationController

  respond_to :json, :html

  def index
    @tweets = Tweet.desc(:sentiment)
    respond_with @tweets
  end
end
