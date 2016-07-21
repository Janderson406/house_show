Rails.application.routes.draw do


  devise_for :users, controllers: { registrations: "registrations" }

  get 'users/my_profile'
  resources :users do  #, only: [:index, :show]
    #resources :events, only: [:new, :show]
    resources :addresses, except: [:destory]
    #   resources :photos
    # end
  end

  #resources :photos
  resources :profiles, except: [:destroy] do
    resources :photos
  end

  #resources :photos, only: [:edit, :destroy]
  resources :addresses, except: [:destory]
  resources :categories, only: [:index, :new, :create, :show]
  resources :events #, only: [:index, :show]

  match "about" => 'welcome#about', via: :get
  root 'welcome#index'

end
