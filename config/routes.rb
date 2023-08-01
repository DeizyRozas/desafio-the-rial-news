Rails.application.routes.draw do
  resources :comentarios, except: [:index, :show]
  #devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :noticia, only: [:index, :show] 
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
