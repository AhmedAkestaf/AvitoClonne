Rails.application.routes.draw do
  get 'annonces/index'
  get 'annonces/show'
  get 'annonces/new'
  get 'annonces/create'
  get 'annonces/edit'
  get 'annonces/update'
  get 'annonces/destroy'
  get 'annonces/mes_annonces'
  get 'annonces/recherche'
  get 'annonces/par_categorie'
  resources :users 
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
 

  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


 # Routes pour les annonces
 resources :annonces
 get '/mes-annonces', to: 'annonces#mes_annonces', as: :mes_annonces
 get '/recherche', to: 'annonces#recherche', as: :recherche
 
 # Route pour la page des catégories
 get '/categories/:categorie', to: 'annonces#par_categorie', as: :categorie
 
 # Raccourci pour publier une annonce
 get '/post', to: 'annonces#new'


  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
