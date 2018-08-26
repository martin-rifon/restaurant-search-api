require 'business/restaurants'

class RestaurantsController < ApplicationController
  def index
    token = request.headers["HTTP_AUTHORIZATION"]
    restaurants = Business::Restaurants::search(
      params[:country],
      params[:user],
      params[:lng],
      params[:lat],
      params[:offset] || 0,
      token
    )

    render json: { restaurants: restaurants }
  end
end
