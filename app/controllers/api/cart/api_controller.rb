module Api
  module Cart
    class ApiController < ApplicationController
      include CartConcern
    end
  end
end