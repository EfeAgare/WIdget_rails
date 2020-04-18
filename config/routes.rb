Rails.application.routes.draw do
  root 'widget#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/auth/users', to: 'authentication#register_user', as: 'register_user'
end
