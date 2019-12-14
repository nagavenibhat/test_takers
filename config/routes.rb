Rails.application.routes.draw do
  root 'test_takers#index'
  resources :test_takers do
    collection do
      post 'bulk_insert', format: [:json, :csv]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
