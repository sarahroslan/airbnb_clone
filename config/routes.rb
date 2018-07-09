

Rails.application.routes.draw do

  
	root 'pages#index'

	
    
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]


  
  resources :listings, shallow: true
 


  end
  #get 'users/:id' => "users#show"
  #post 'users/:id/listings/:id' => "users/id/listings#show"
  #get "/index" => "pages#index", as: "index"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

end

