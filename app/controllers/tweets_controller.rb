class TweetsController < ApplicationController


  def index
    @tweets = Tweet.search(params).desc(:created_at).page(params[:page])
  end

  
end
