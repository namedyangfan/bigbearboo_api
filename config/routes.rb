Rails.application.routes.draw do
  scope module: 'api' do
    namespace :auth do
      controller :users do
        post '/signup', action: :create
        get '/user/:user_id', action: :show
      end

      controller :sessions do
        get '/authenticate', action: :authenticate
        post '/login', action: :create
        delete '/logout', action: :destroy
      end
    end

    namespace :admin do
      controller :products do
        get '/products', action: :index
        post '/products', action: :create
        patch '/products/:product_id/update_name', action: :update_name
      end
    end

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
