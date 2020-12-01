Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show,:index,:edit,:update]
  resources :categories, only: [:index, :create, :edit, :update]
  resources :items
  resources :rentals, only: [:index, :new, :create]
  resources :logs

  # get 'get_info', to: 'items#get_info', path: "/items/new/get_info"
  get 'return', to: 'rentals#pre_return', path: "/rentals/return"
  # get 'search_book', to: 'rentals#search_book', path: "/rentals/return/search_book"
  post 'rentals', to: 'rentals#post_return', path: "/rentals/return"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
