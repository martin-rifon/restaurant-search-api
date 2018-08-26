require 'services/pedidos_ya'

module Business
  module Users
    def self.get(token)
      Services::PedidosYa.get_user(token)
    end
  end
end
