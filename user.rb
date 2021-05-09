# frozen_string_literal: true

class User < Player
  attr_reader :name

  def initialize(name)
    @name = name
    super()
  end

  def make_bet
    raise "У #{name} нет денег для продолжения игры" if bank < 10

    super
  end
end
