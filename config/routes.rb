Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'

  resources :photos do
    resources :comments
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

end
