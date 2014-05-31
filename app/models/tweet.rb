class Tweet
  include Mongoid::Document
	  field :text, type: String
	  field :user, type: String
	  field :coordinates, type: Array
	  field :created_at, type: DateTime
	  index({ coordinates: "2dsphere" }, { min: -180, max: 180 })
	  index({ created_at: 1}, {unique: true})

end