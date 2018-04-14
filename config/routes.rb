Rails.application.routes.draw do
  scope module: 'api' do
    namespace :auth do
      resources :users
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
