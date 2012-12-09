require 'spec_helper'

describe Tweet do
  describe ".load" do
    context "given we are able to fetch tweets from the API" do
      it "should create the tweets returned by the API" do
        VCR.use_cassette('successful_tweet_load', :record => :new_episodes) do
        Tweet.count.should eq(0)
        Tweet.load.should eq(:ok)
        Tweet.count.should eq(2)
        Tweet.find(15).should_not be_nil
        Tweet.find(9).should_not be_nil
        end
      end
    end

    context "given the loader cannot load tweets from the API" do
      it "should return nil, meaning there were problems and not create any new documents" do
        Load.any_instance.should_receive(:load).and_return(nil)
        Tweet.count.should eq(0)
        Tweet.load.should eq(:error)
        Tweet.count.should eq(0)
      end
    end

    context "given the loader loads an existing tweet" do

      let(:tweet) { {
        "created_at"=>"2012-12-07T16:57:12Z",
        "followers"=>5,
        "id"=>17,
        "message"=>"Coke is great",
        "sentiment"=>0.7,
        "updated_at"=>"2012-12-07T16:57:12Z",
        "user_handle"=>"@coke_lvr"}
      }

      it "should just increment the counter" do
        Load.any_instance.should_receive(:load).twice.and_return([tweet])
        Tweet.count.should eq(0)
        Tweet.load
        Tweet.count.should eq(1)
        saved_tweet = Tweet.first
        saved_tweet.id.should eq(17)
        saved_tweet.count.should eq(1)
        Tweet.load
        Tweet.count.should eq(1)
        saved_tweet = Tweet.first
        saved_tweet.id.should eq(17)
        saved_tweet.count.should eq(2)
      end
    end
  end
end
