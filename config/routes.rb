# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: 'arms#index'

  resources :arms do
    resources :participants
  end

  get '/process_participant_validity', to: 'participants#process_participant_validity'

  resources :clinics
  resources :doctors

  resources :sites, only: [:index] do
    collection do
      get :load_sites
    end
  end
end
