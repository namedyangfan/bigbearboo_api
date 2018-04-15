Rails.application.routes.draw do
  scope module: 'api' do
    namespace :auth do
      controller :users do
        post '/signup', action: :create
      end

      controller :sessions do
        post '/login', action: :create
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
