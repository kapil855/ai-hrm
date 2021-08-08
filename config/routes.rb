Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    callbacks: 'users/callbacks'
  }

  namespace :admin do 
    resources :users 
    get '/attendance', to: 'users#attendance'
    #delete 'destroy_attendance', to: 'users#destroy_attendance'
  end
end
