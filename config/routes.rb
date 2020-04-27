Rails.application.routes.draw do
  resources :hamburguesa_ingredientes
  get '/hamburguesa', to: 'hamburguesas#index'
  get '/hamburguesa/:id', to: 'hamburguesas#show'
  post '/hamburguesa', to: 'hamburguesas#create'
  delete '/hamburguesa/:id', to: 'hamburguesas#destroy'
  patch '/hamburguesa/:id', to: 'hamburguesas#update'

  get '/ingrediente', to: 'ingredientes#index'
  get '/ingrediente/:id', to: 'ingredientes#show'
  post '/ingrediente', to: 'ingredientes#create'
  delete '/ingrediente/:id', to: 'ingredientes#destroy'
  patch '/ingrediente/:id', to: 'ingredientes#update'

  put '/hamburguesa/:hamburguesa_id/ingrediente/:ingrediente_id', to: 'hamburguesa_ingredientes#agregar_ingredientes'
  delete '/hamburguesa/:hamburguesa_id/ingrediente/:ingrediente_id', to: 'hamburguesa_ingredientes#eliminar_ingredientes'
  resources :ingredientes
  resources :hamburguesas
  resources :hamburguesas do
  resources :ingredientes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
