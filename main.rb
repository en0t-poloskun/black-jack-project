# frozen_string_literal: true

require_relative 'player'
require_relative 'user'
require_relative 'dealer'
require_relative 'interface'
require_relative 'card'
require_relative 'deck'

class Main
  def initialize
    @interface = Interface.new
  end

  def blackjack
    name = interface.name
    user = User.new(name)
    dealer = Dealer.new
  end

  private

  attr_accessor :interface
end
