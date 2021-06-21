Rails.application.routes.draw do

  get "/" => "session#new"
  
  resources :users do 
  end

  resources :sessions do 
  end

  resources :secrets do
  end
end
