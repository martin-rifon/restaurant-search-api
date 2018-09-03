require 'business/metrics'

class MetricsController < ApplicationController
  def index
    metrics = Business::Metrics::get

    render json: { metrics: metrics }
  end
end
