Rails.application.routes.draw do
  root to: "home#home"
  resources :team_members
  resources :pokemon, only: [:index, :new, :create, :show, :update] do
    resources :levels, only: :create
  end

  get "auth/:provider/callback", to: "sessions#create"
  get "login",      to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
end
