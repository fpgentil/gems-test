Rails.application.routes.draw do
  root 'home#index'

  resources :oxford_learners_dictionaries, only: :index do
    collection do
      get :search
    end
  end
end
