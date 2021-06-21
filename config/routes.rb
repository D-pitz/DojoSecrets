Rails.application.routes.draw do

  get "/" => "session#new"
  
  resources :users do 
  end

  resources :sessions do 
  end

end
