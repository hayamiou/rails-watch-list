Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'lists#index'
  resources :lists do
    resources :bookmarks, only: %i[index new create]
  end
  resources :bookmarks, only: :destroy
end
