Rails.application.routes.draw do

  get "/" => "users#new"
  
  resources :users do 
  end

  resources :sessions do 
  end

  resources :secrets do
    resources :likes do
    end
  end

end
