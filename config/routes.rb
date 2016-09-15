Rails.application.routes.draw do
#  resources :users
  devise_for :users
  resources :images do
    resources :tags
  end
  resources :users
  root to: "images#index"
  get 'tag/:id' => 'tags#index', :as => :tag
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
