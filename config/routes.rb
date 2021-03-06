Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only => [:index, :create, :destroy]
  get 'products/:id/edit', to: 'products#index'
  resources :products, :only => [:index, :create, :destroy, :update, :show]
  
  resources :products do
    resources :histroys, :only => [:create,]
  end
end
