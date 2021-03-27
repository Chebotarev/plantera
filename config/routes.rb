# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'comment/create'
  root to: 'plant_species#index'
  get 'home/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources 'plant_species' do
    collection do
      get 'search'
    end
  end

  resources 'collected_plants', only: %i[new create index destroy update] do
    collection do
      get 'watering_report'
    end
  end
  
  resources 'comments', only: :create
end
