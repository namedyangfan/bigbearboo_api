class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include AuthenticationConcern
  include CartConcern
end
