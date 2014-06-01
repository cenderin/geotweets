class Tweet
  include Mongoid::Document
  field :text, type: String
  field :location, type: Array, default: []
  field :user, type: String
  field :created_at, type: DateTime
  index({:location => "2d"}, { min: -200, max: 200 })

  def self.search(params)
    if params[:long]== nil
      self.all
    else
    	self.where(:location => { "$near" => [params[:long].to_f, params[:lat].to_f], '$maxDistance' => params[:radius].to_f })

    end
  end
end