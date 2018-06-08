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
        get '/products/:product_id', action: :show
        get '/products', action: :index
        post '/products', action: :create
        patch '/products/:product_id', action: :update
        delete '/products/:product_id', action: :destroy
      end

      controller :product_attributes do
        get '/product_attributes', action: :show
        post '/product_attributes/:product_id', action: :create
        patch '/product_attributes/:product_attribute_id', action: :update
        delete '/product_attributes/:product_attribute_id', action: :destroy
      end
    end

    namespace :home do
      controller :products do
        get '/products', action: :index
        get '/products/:product_id', action: :show
      end
    end

    namespace :cart do
      controller :orders do
        get '/orders', action: :show
        delete '/orders/:order_id', action: :destroy
      end

      controller :order_items do
        post '/order_items', action: :create
        patch '/order_items/:order_item_id', action: :update
        delete '/order_items/:order_item_id', action: :destroy
      end
    end

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
