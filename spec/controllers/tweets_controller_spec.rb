require 'spec_helper'

describe TweetsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    context "when requesting json" do

      it "should return a list of tweets in json ordered by sentiment" do
        VCR.use_cassette('success_controller_testing', :record => :new_episodes) do
          Tweet.load
          get 'index', format: :json
          JSON.parse(response.body).should eq([
            {"_id"=>3, "count"=>1, "created_at"=>"2012-09-27T16:11:15Z", "followers"=>24, "id"=>3, "message"=>"Coke is it!", "sentiment"=>1.0, "updated_at"=>"2012-09-27T16:11:15Z", "user_handle"=>"@coke_snortr"},
            {"_id"=>16, "count"=>1, "created_at"=>"2012-12-07T16:55:45Z", "followers"=>3, "id"=>16, "message"=>"Hi there", "sentiment"=>0.0, "updated_at"=>"2012-12-07T16:55:45Z", "user_handle"=>"@idiot"}
          ])
          response.status.should eq(200)
        end
      end
    end
  end

  describe "GET 'user'" do
    context "given a user handle" do
      it "should only return messages specific to that user" do
        VCR.use_cassette('success_controller_testing', :record => :new_episodes) do
          Tweet.load
          get 'user', format: :json, user_handle: "@idiot"
          JSON.parse(response.body).should eq([{"_id"=>16, "count"=>1, "created_at"=>"2012-12-07T16:55:45Z", "followers"=>3, "id"=>16, "message"=>"Hi there", "sentiment"=>0.0, "updated_at"=>"2012-12-07T16:55:45Z", "user_handle"=>"@idiot"}])
        end
      end
    end
  end

end
