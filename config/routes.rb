Rails.application.routes.draw do
  root to: "home#home"
  resources :pokemon do
    resources :levels, only: :create
    resources :increase_evs, only: :create
  end
  resources :species

  get "auth/:provider/callback", to: "sessions#create"
  get "login",      to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
end
