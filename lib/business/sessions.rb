require 'business/metrics'
require 'services/pedidos_ya'

module Business
  module Sessions
    def self.create_session(user, pass)
      user_session = Services::PedidosYa.create_session(user, pass)

      p ''
      p 'user_session'
      p user_session
      p ''

      Metrics::store_login(user)

      user_session
    end
  end
end
