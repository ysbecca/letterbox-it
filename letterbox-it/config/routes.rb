Rails.application.routes.draw do
  

	resources :distributions



	root 'welcome#index'

end
