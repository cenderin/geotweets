class Tweet

  include Mongoid::Document
  field :text, type: String
  field :location, type: Array, default: []
  field :user, type: String
  field :created_at, type: DateTime
  index({:location => "2d"}, { min: -200, max: 200 })
  paginates_per 25

  def self.search(params)
    if params[:long].present?
     self.where(:location => { "$near" => [params[:long].to_f, params[:lat].to_f], '$maxDistance' => params[:radius].to_f })
    else
    	self.all
    end
  end
end