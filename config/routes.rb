Rails.application.routes.draw do
  root 'colonies#index'
  resources :colonies do
    member do
      post "cat"
  end
end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
