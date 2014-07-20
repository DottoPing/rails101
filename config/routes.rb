Groupme::Application.routes.draw do
  devise_for :users
  resources :groups do
    member do
      post :join
      post :quit
    end
    resources :posts
  end
  root :to => "groups#index"
end
