# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  root "home#index"
  get "latest" => "home#latest"
  resources :items do
    patch "like", "unlike", on: :member
  end
  resources :users, only: [:show, :voted] do
    get "voted", on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
