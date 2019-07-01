Rails.application.routes.draw do
  root 'administrator/sessions#new'

  get     '/login',     to: 'administrator/sessions#new'
  post    '/login',     to: 'administrator/sessions#create'
  delete  '/logout',    to: 'administrator/sessions#destroy'

  namespace :administrator do
    get 'home', to: 'pages#index'

    resources :administrators do
      member do
        get 'reset_password'
        get 'enable'
        get 'disable'
      end
    end
  end

end
