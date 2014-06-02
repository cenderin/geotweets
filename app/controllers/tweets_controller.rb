class TweetsController < ApplicationController


  def index
    @tweets = Tweet.search(params).desc(:created_at).page(params[:page]).limit(100)
  end

  
end
