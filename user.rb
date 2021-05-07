# frozen_string_literal: true

class User < Player
  attr_reader :name

  def initialize(name)
    @name = name
    super()
  end
end
