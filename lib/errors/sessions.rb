class InvalidCredentials < StandardError
  def message
    'Invalid credentials'
  end
end
