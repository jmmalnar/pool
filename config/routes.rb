Rails.application.routes.draw do

  resources :pools do
    resources :readings, except: [:index], controller: 'pools/readings'
  end
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do
    root "pools#index", as: :authenticated_root
  end

  root "pages#welcome", page: "home"
  get "/pages/:page" => "pages#show"
end
