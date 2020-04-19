Rails.application.routes.draw do
  
  root 'widget#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/auth/users', to: 'authentication#register_user', as: 'register_user'
  post '/oauth/token', to: 'authentication#login_user', as: 'login_user'
  post '/oauth/revoke', to: 'authentication#logout_user', as: 'logout_user'

  get '/widgets/new', to: 'widget#new', as: 'new_widget'
  post '/widgets/create', to: 'widget#create', as: 'create_widget'
  get '/widgets/:id/edit', to: 'widget#edit', as: 'edit_widget'
  put '/widgets/:id/edit', to: 'widget#update', as: 'update_widget'
  delete '/widgets/:id/delete', to: 'widget#delete', as: 'delete_widget'
  get '/widgets/index', to: 'widget#user_widget', as: 'user_widget'

  get '/widgets/search', to: 'search#widget_search', as: 'widget_search'

  get '/user/widgets/search', to: 'user#user_widget_search', as: 'user_widget_search'

  get 'users/profile', to: 'user#index', as: 'user_profile'
  get 'users/:id/profile', to: 'user#other_users_profile', as: 'get_user_profile'

  post '/user/change', to: 'user#change_password', as: 'change_password'
  post '/user/reset', to: 'user#reset_password', as: 'reset_password'

  get '/user/edit', to: 'user#edit', as: 'edit_profile'
  post '/user/profile/edit', to: 'user#edit_user', as: 'edit_user'

end
