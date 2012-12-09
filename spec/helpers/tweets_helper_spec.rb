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
end
