Rails.application.routes.draw do
  post 'registrations/create' #where form posts to
  get 'registrations/new'     #form page itself  /registrations/new

  devise_for :users  #, controllers: { registrations: "registrations" }

  get 'users/my_profile'
  get 'users/hosts'
  get 'users/artists'
  get 'events/my_events'
  resources :users do  #, only: [:index, :show]
    #resources :events, only: [:new, :show]
    resources :addresses, except: [:destory]
    #   resources :photos
    # end
  end

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
