Rails.application.routes.draw do
  devise_for :users, controllers: {
                                    sessions: 'users/sessions',
                                    registrations: 'users/registrations',
                                    passwords: 'users/passwords'
                                  }
  get '/general_shopping_list', to: 'recipe_foods#index', as: 'shopping_list'
  resources :foods, only: %i[index show new create destroy]
  resources :recipes, only: %i[index show new create destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
