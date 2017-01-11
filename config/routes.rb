Rails.application.routes.draw do
  

  resources :requests do
    collection do
      get 'manage_all'
      get 'approve/:id' => :approve, as: 'approve'
    end
  end

  resources :regions do
    collection do
      get 'manage_all'
    end
  end

  resources :users do
    collection do
      get 'show/:id' => :show, as: 'show'
      get 'edit/:id' => :edit, as: 'edit'
      patch 'update/:id' => :update, as: 'update'
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
	resources :distributions


	root 'welcome#index'

end
