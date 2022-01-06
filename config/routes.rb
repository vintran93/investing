Rails.application.routes.draw do
  devise_for :users
  
  root 'home#index'
  get 'home/about'
  get 'home/search'
  get 'currencies/table'

  get 'currencies/new', to: 'currencies#new', as: 'new_currency'
  get 'currencies', to: 'currencies#index', as: 'currencies'
  get 'currencies/:id/edit', to: 'currencies#edit', as: 'edit_currency'
  get 'currencies/:id', to: 'currencies#show', as: 'currency'
  post 'currencies', to: 'currencies#create' 
  
  patch 'currencies/:id', to: 'currencies#update'
  put 'currencies/:id', to: 'currencies#update'
  delete '/currencies/:id', to: 'currencies#destroy'

  post '/home/search' => 'home/search'

  get 'portfolios/new', to: 'portfolios#new', as: 'new_portfolio'
  get 'portfolios', to: 'portfolios#index', as: 'portfolios'
  get 'portfolios/:id/edit', to: 'portfolios#edit', as: 'edit_portfolio'
  get 'portfolios/:id', to: 'portfolios#show', as: 'portfolio'

  patch 'portfolios/:id', to: 'portfolios#update'
  put 'portfolios/:id', to: 'portfolios#update'
  delete '/portfolios/:id', to: 'portfolios#destroy'

  post '/portfolios', to: 'portfolios#create'
end
