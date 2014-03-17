Travelly::Application.routes.draw do
  root 'welcome#index'

  resources :trips do
    resources :stops, only: [:new, :create]
  end

  resources :places, only: [:show]
end
