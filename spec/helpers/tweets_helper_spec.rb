require 'spec_helper'

describe TweetsHelper do
  describe "#style_message" do
    context "given a message containing 'coke'" do
      it "should add the red class" do
        helper.style_message("what a nice coke").should eq("<p class=\"red\">what a nice coke</p>")
      end
    end

    context "given a message containing 'coca-cola'" do
      it "should add the red class" do
        helper.style_message("what a nice coca-cola").should eq("<p class=\"red\">what a nice coca-cola</p>")
      end
    end

    context "given a message containing 'diet cola'" do
      it "should add the red class" do
        helper.style_message("what a nice diet cola").should eq("<p class=\"red\">what a nice diet cola</p>")
      end
    end

    context "given a message containing no keywords" do
      it "should NOT add the red class" do
        helper.style_message("what a nice soda").should eq("<p>what a nice soda</p>")
      end
    end
  end

  describe "#to_img" do
    context "given a negative sentiment" do
      it "should show a negative smiley" do
        helper.to_img(-0.9).should eq("<img alt=\"Negative\" src=\"/assets/negative.png\" />")
      end
    end

    context "given a positive sentiment" do
      it "should show a positive smiley" do
        helper.to_img(0.7).should eq("<img alt=\"Positive\" src=\"/assets/positive.png\" />")
      end
    end

    context "given a neutral sentiment" do
      it "should show a neutral smiley" do
        helper.to_img(0.1).should eq("<img alt=\"Neutral\" src=\"/assets/neutral.png\" />")
      end
    end

  end
end
