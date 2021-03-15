Rails.application.routes.draw do
  get 'user/index'
  get 'user/create'
  get 'user/update'
  get 'user/delete'
  resources :tasks
  api_guard_routes for: 'users', controller: {
  registration: 'users/registration',
  authentication: 'users/authentication',
  passwords: 'users/passwords',
  tokens: 'users/tokens'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
