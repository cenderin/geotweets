class Tweet
  include Mongoid::Document
  field :text, type: String
  field :location, type: Array, default: []
  field :user, type: String
  field :created_at, type: DateTime
  index({ created_at: 1 }, { expire_after_seconds: 14400 })
  index({:location => "2d", tags: 1 }, { background: true })

  def self.search(params)
    if params[:long]== nil
      self.all
    else
      self.near(coordinates: [params[:long].to_f, params[:lat].to_f]).max_distance(coordinates: params[:radius].to_f)
    end
  end
end

