Rails.application.routes.draw do
  scope module: 'api' do
    namespace :auth do
      controller :users do
        post '/signup', action: :create
        get '/user', action: :show
      end

      controller :sessions do
        get '/authenticate', action: :authenticate
        post '/login', action: :create
        delete '/logout', action: :destroy
      end

    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
