Rails.application.routes.draw do
  get 'client/name'

  get 'client/order'

  resources :posts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :banners do
    collection do
        get 'search'
    end
  end
  root 'banners#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
