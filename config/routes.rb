Rails.application.routes.draw do
  resources :topics, path: "blog/topics", only: [:index, :show]
  

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root to: 'pages#home'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs, path: "blog" do
    member do
      get :toggle_status
    end
  end

  mount ActionCable.server => '/cable'

end
