Rails.application.routes.draw do
  resources :posts
  get 'sign-in', as: 'sign_in', to: 'auth#sign_in'
  post 'sign-in', as: 'login', to: 'auth#login'
  get 'logout', as: 'logout', to: 'auth#logout'

  get 'create-test-user', as: 'test-sign-in', to: 'auth#test_create_user'
  get 'users', as: 'users', to: 'auth#users'

  scope '/users/:id' do
    get 'posts', as: 'user_posts', to: 'posts#user_posts'
  end

  root 'application#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
