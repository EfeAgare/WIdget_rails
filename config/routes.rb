Rails.application.routes.draw do
  root 'widget#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/auth/users', to: 'authentication#register_user', as: 'register_user'
  post '/oauth/token', to: 'authentication#login_user', as: 'login_user'
  post '/oauth/revoke', to: 'authentication#logout_user', as: 'logout_user'

  get '/widgets/new', to: 'widget#new', as: 'new_widget'
  post '/widgets/create', to: 'widget#create', as: 'create_widget'
  get '/widgets/:id/edit', to: 'widget#edit', as: 'edit_widget'
  post '/widgets/:id/edit', to: 'widget#update', as: 'update_widget'
end
