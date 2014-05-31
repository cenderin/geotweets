class Tweet
  include Mongoid::Document
  field :text, type: String
  field :lat, type: String, default: 0
  field :lng, type: String, default: 0
  field :created_at, type: DateTime

  index({ coordinates: "2dsphere" }, { min: -180, max: 180 })
  index({ created_at: 1}, {unique: true})

end
