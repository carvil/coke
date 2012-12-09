require 'spec_helper'

describe Load do
  describe "#conn" do
    context "given an instance of Load" do
      it "should contain a Faraday connection to the endpoint" do
        subject.conn.is_a?(Faraday::Connection).should be_true
      end
    end
  end

  describe "#config" do
    context "given an instance of Load" do
      it "should read the configuration file" do
        subject.config.should eq({"url"=>"http://adaptive-test-api.herokuapp.com", "endpoint"=>"/tweets.json"})
      end
    end
  end

  describe "#tweets_url" do
    context "given an instance of Load" do
      it "should return the url from the configuration" do
        subject.tweets_url.should eq("http://adaptive-test-api.herokuapp.com")
      end
    end
  end

  describe "#endpoint" do
    context "given an instance of Load" do
      it "should return the endpoint from the configuration" do
        subject.endpoint.should eq("/tweets.json")
      end
    end
  end

  describe "#load" do
    context "given a successful call to the tweets' api" do
      it "should return a list of tweets" do
        VCR.use_cassette('successful_load', :record => :new_episodes) do
          subject.load.should eq([
            {"created_at"=>"2012-09-27T16:18:50Z", "followers"=>245, "id"=>14, "message"=>"Coke coke coke coke coke!!!!", "sentiment"=>0.4, "updated_at"=>"2012-09-27T16:18:50Z", "user_handle"=>"@coke_snortr"},
            {"created_at"=>"2012-09-27T16:12:31Z", "followers"=>12, "id"=>5, "message"=>"I don't like pepsi.  I prefer #coke", "sentiment"=>-0.1, "updated_at"=>"2012-09-27T16:12:31Z", "user_handle"=>"@kevin"}
          ])
        end
      end
    end

    context "given an error during the call to the tweets' api" do
      it "should return nil" do
        VCR.use_cassette('failed_load', :record => :new_episodes) do
          Faraday::Response.any_instance.should_receive(:status).and_return(500)
          subject.load.should eq(nil)
        end
      end
    end
  end

end
