Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'topics#index'
  get 'reset' => 'topics#reset'
  resources :topics
  resources :microposts
  resources :replies
end
