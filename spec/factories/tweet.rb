
FactoryGirl.define do
  factory :tweet do
    user "cenderin"
    text "bundle all the things!"
    location [36.1215, 115.1739]
    created_at Time.now
  end
end