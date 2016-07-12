Rails.application.routes.draw do

  devise_for :users

  get 'users/account'
  resources :users, only: [:index, :show] do
    resources :events#, only: [:create, :destroy]
    resources :addresses, except: [:destory]
    resources :profiles, except: [:destroy]
  end

  resources :profiles, except: [:destroy]
  resources :addresses, except: [:destory]
  resources :categories, only: [:index, :new, :create, :show]
  resources :events #, only: [:index, :show]

  match "about" => 'welcome#about', via: :get
  root 'welcome#index'

end
