Rails.application.routes.draw do
root "shops#index"
get "shops/new", :to => "shops#new"
get "shops/:id", :to => "shops#show"

post "shops", :to => "shops#create"
get "reservations", :to => "reservations#index"
get "reservations/new", :to => "reservations#new"
post "reservations", :to => "reservations#create"
get "reservations/:id", :to => "reservations#show"


  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
} 

devise_scope :user do
  get "user/:id", :to => "users/registrations#detail"
  get "signup", :to => "users/registrations#new"
  get "login", :to => "users/sessions#new"
  get "logout", :to => "users/sessions#destroy"
end
end
