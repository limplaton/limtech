Rails.application.routes.draw do
    get 'outgoing/index'
    mount ActionCable.server => '/cable'

    resources :clients
    resources :overtimes
    resources :holidays
    resources :designations
    resources :departments
    resources :employees

    resources :rooms do
        resources :messages
        collection do
            post :search 
        end
    end

    get 'rooms/leave/:id', to: 'rooms#leave', as: 'leave_room'
    get 'rooms/join/:id', to: 'rooms#join', as: 'join_room'

    get 'employees/video/:id', to: 'rooms#call'
    get 'employees/calls/:id', to: 'rooms#video'

    get 'rooms/index'
    get '/signin', to: 'sessions#new'
    post '/signin', to: 'sessions#create'
    delete '/signout', to: 'sessions#destroy'

    get 'dashboard' => 'dashboard#index'
    get 'sessions/new'

    get '/signin' => 'sessions#new'
    post '/sessions/new' => 'sessions#create'
    get '/signout' => 'sessions#destroy'

    root 'dashboard#index'
end
