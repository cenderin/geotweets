class Tweet
  include Mongoid::Document
  field :text, type: String
  field :location, type: Array, default: []
  field :user, type: String
  field :created_at, type: DateTime
  index({:location => "2d"}, { min: -200, max: 200 })

  def self.search(params)
    if params[:long].present?
    	# self.geo_near([params[:long].to_f, params[:lat].to_f]).max_distance(params[:radius].to_f)
     self.where(:location => { "$near" => [params[:long].to_f, params[:lat].to_f], '$maxDistance' => params[:radius].to_f.fdiv(69)})
    else
    	self.all
    end
  end
end