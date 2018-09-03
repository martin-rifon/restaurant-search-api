require 'business/metrics'
require 'services/pedidos_ya'

module Business
  module Restaurants
    def self.search(country_id, user, lng, lat, offset, token)
      restaurant_fields = "name, deliveryTimeMaxMinutes, opened, topCategories, ratingScore, " \
        "logo, link, coordinates"
      results = Rails.cache.fetch("restaurants/#{lng},#{lat},#{country_id},#{restaurant_fields}",
        expires_in: 1.hour) do
        Services::PedidosYa.search_restaurants(
          country_id,
          lng,
          lat,
          offset,
          token,
          restaurant_fields
        )
      end

      results = results['data'].select { |restaurant| restaurant['opened'] == 1 }
        .sort_by { |restaurant| restaurant['ratingScore'] }
        .reverse



      Metrics::store_search(user, lng, lat)

      results
    end
  end
end
