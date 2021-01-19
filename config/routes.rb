Rails.application.routes.draw do
  root 'flights#index'
  resources :flights, except: [:edit, :update, :destroy]
  resources :airports, except: [:edit, :update, :destroy]
  resources :bookings, except: [:edit, :update]
end
