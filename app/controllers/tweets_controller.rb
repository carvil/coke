class TweetsController < ApplicationController

  respond_to :json, :html

  def index
    @tweets = Tweet.all
    respond_with @tweets
  end
end
