Rails.application.routes.draw do
  resources :ethbtcs
  resources :gains
  resources :counts
  resources :shares do
    resources :counts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
