require 'spec_helper'

describe Tweet do
  let(:tweet1){ FactoryGirl.create(:tweet, screen_name: "cenderin",
                                   text: "bundle all the things 1",
                                   location: [36.1215, 115.1739],
                                   created_at: Time.now)}

  let(:tweet2){ FactoryGirl.create(:tweet, screen_name: "cenderin",
                                   text: "bundle all the things 2",
                                   location: [36.1215, 115.1739],
                                   created_at: Time.now + 1.hour)}

  it "has a valid factory" do
    expect(FactoryGirl.build(:tweet)).to be_valid
  end

  it "returns all tweets within specification" do
    tweet1
    tweet2
    params = {:long => 36.1215, :lat => 115.1739, :radius => 10}

    expect(@tweets).to eq [tweet_2, tweet_1]
  end
end

