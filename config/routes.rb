Geotweets::Application.routes.draw do
  root :to => "tweets#index"
  resources :tweets
end
