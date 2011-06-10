Weblinda::Application.routes.draw do
  
  ActiveAdmin.routes(self)

  root :to => 'application#index'
  
  match 'attribution' => 'application#attribution'

  resources :user_sessions
  resources :users

  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
    
  match 'stories/order' => 'stories#order'
  match 'stories/tag' => 'stories#tag'
  match 'stories/remove' => 'stories#remove'
  
  resources :language, :path => '' do
    get :search
    
    resources :morphemes
    resources :lexemes
    resources :phrases
    resources :stories
  end
  
end
