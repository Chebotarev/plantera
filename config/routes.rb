# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'collected_plants/new'
  get 'collected_plants/index'
  get 'collected_plants/destroy'
  get 'collected_plants/update'
  root to: 'home#index'
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
end
