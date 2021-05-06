# frozen_string_literal: true

class User < Player
  def initialize(name)
    @name = name
    super()
  end
end
