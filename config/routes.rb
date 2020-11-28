Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :categories, only: [:index, :create, :edit, :update]
  resources :equipments
  resources :rentals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
