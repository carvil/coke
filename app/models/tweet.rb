class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps

  field :id, type: Integer
  field :sentiment, type: Float
  field :user_handle, type: String
  field :followers, type: Integer
  field :message, type: String
  field :count, type: Integer, default: 1

  field :_id, type: Integer, default: -> { id }

  attr_accessible :id, :sentiment, :user_handle, :followers, :message, :created_at, :updated_at

  validates_presence_of :id

  def self.load
    if tweets = $loader.load
      tweets.each do |tweet|
        if existing_tweet = Tweet.where(id: tweet["id"]).first
          existing_tweet.count += 1
          existing_tweet.save!
        else
          Tweet.create!(tweet)
        end
      end
      :ok
    else
      :error
    end
  end

end
