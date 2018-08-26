require 'business/users'

class UsersController < ApplicationController
  def index
    user = Business::Users::get(request.headers["HTTP_AUTHORIZATION"])

    render json: { user: user }
  end
end
