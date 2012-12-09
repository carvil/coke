require 'spec_helper'

describe "Tweets" do

  describe "index page" do
    context "given a request to the index page", js: true do
      it "should contain a 'fetch more messages' button" do
        VCR.use_cassette('success_controller_testing', :record => :new_episodes) do
          visit '/'
          page.should have_content "Coke related tweets"
          page.should have_link "Fetch more messages"
        end
      end
    end

    context "given a click to fetch more message" do
      it "should fetch messages", js: true do
        VCR.use_cassette('success_controller_testing', :record => :new_episodes) do
          visit '/'
          click_link "Fetch more messages"
          sleep 1
          page.should have_content "Coke is it!"
          page.should have_content "Hi there"

          page.should have_link "@idiot"
          page.should have_link "@coke_snortr"
        end
      end
    end

    context "given an error in the API" do
      it "should show the error message", js: true do
        VCR.use_cassette('failed_load_tweets', :record => :new_episodes) do
          Faraday::Response.any_instance.should_receive(:status).and_return(500)
          visit '/'
          click_link "Fetch more messages"
          sleep 1
          page.should have_content "Something went wrong, please try again"
        end
      end
    end

    context "given a number of tweets" do
      it "should be possible to navigate to a specific user's page", js: true do
        VCR.use_cassette('user_tweets', :record => :new_episodes) do
          visit '/'
          click_link "Fetch more messages"
          sleep 1
          page.should have_selector("table tbody tr", count: 2)
          page.should have_link "@pepsi"
          page.should have_link "@mad4vimto"
          click_link "@pepsi"
          page.should have_selector("table tbody tr", count: 1)
        end
      end
    end
  end
end
