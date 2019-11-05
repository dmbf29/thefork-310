Rails.application.routes.draw do
  # HTTP_VERB 'PATH', to: 'CONTROLLER#ACTION', as: :PREFIX

  # CRUD
  # Read all
  get '/restaurants', to: 'restaurants#index', as: :restaurants

  # Create
  # form to fill out
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant
  # send the info from the the form
  post '/restaurants', to: 'restaurants#create'

  # Read one
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant


  # Update
  # form to fill out
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant
  # updates the DB
  patch '/restaurants/:id', to: 'restaurants#update'

  # Destroy
  delete 'restaurants/:id', to: 'restaurants#destroy'
end





