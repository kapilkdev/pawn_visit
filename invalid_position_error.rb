class InvalidPositionError < StandardError
  def initialize(message)
    super(message)
  end
end