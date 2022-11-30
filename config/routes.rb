Rails.application.routes.draw do
  devise_for :users

  root to: 'visitors#index'
  resources :visitors, only: [:index, :show] do
    collection do
      get :search_post
      get :posts
      post :comment
    end
  end

  namespace :admin do
  	root to: "dashboards#index"
    resources :dashboards, only: [:index]
    resources :blog_categories
    resources :blog_posts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
