class TweetsController < ApplicationController

  def index
  	@tweet = Tweet.all
  end

end
