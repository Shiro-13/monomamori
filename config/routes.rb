Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'post_rentals/index'
  get 'post_rentals/create'
  get 'post_rentals/update'
  get 'post_rental/index'
  get 'post_rental/create'
  get 'post_rental/update'
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show,:index,:edit,:update] do
    get :favorites, on: :collection
  end
  resources :categories, only: [:index, :create, :edit, :update]
  resources :items do
    resource :favorites, only: [:create, :destroy]
  end
  resources :rentals, only: [:index, :new, :create]
  # post "/rentals/pre_rental" => "rentals#pre_rental", as: 'pre_rental'
  resources :logs
  resources :post_rentals, only:[:index, :update, :create]
  # get '/post_rentals' => 'post_rentals#post_rental'
  get '/search' => 'searchs#search'

  # get 'get_info', to: 'items#get_info', path: "/items/new/get_info"
  # get 'return', to: 'rentals#pre_return', path: "/rentals/return"
  # get 'search_book', to: 'rentals#search_book', path: "/rentals/return/search_book"
  # post 'rentals', to: 'rentals#post_return', path: "/rentals/return"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
