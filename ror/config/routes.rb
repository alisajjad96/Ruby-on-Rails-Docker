Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/products/test-create', to: 'products#test_create', as: 'product_create_test'
  get '/products/test-delete-all', to: 'products#test_delete_all', as: 'product_delete_all_test'
  resources 'products'

  root :to => "products#index"
end
