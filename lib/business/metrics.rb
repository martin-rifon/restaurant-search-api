# require 'models/metric'

module Business
  module Metrics
    def self.store_search(user, lng, lat)
      Metric.create({ name: 'search', data: { lng: lng, lat: lat } })
    end

    def self.store_login(user)
      Metric.create({ name: 'login', data: { user: user } })
    end

    def self.get
      Metric.all.to_a.group_by(&:name)
    end
  end
end
