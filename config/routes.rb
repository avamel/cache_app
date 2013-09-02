CacheApp::Application.routes.draw do

  resources :comments

  resources :articles

  root :to => "users#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end