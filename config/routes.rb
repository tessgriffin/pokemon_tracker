Rails.application.routes.draw do
  root to: "home#home"

  get "auth/:provider/callback", to: "sessions#create"
  get "login",      to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
end
