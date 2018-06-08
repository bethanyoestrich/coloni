Rails.application.routes.draw do
  root 'home#index'
  resources :colonies do
    member do
      post "cat"
    end
  end
  get '/signup', to: 'users#new'
  resources :users, except:[:new]

  get "/home", controller: :home, action: :index
end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
