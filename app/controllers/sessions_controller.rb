require 'business/sessions'
require 'errors/sessions'

class SessionsController < ApplicationController
  def create
    session = Business::Sessions::create_session(params[:user], params[:pass])

    render json: { session: session }
  rescue InvalidCredentials
    render json: {}, status: 401
  end
end
