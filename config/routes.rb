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


  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout' , to:'sessions#destroy'

end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
