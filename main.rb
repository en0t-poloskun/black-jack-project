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
    @bank = 0
  end

  def blackjack
    name = interface.name
    self.user = User.new(name)
    self.dealer = Dealer.new
    game
  end

  private

  def game
    distribution
    bet
    user_move
  end

  def distribution
    self.deck = Deck.new
    interface.distribution
    2.times { user.add_card(deck) }
    2.times { dealer.add_card(deck) }
    interface.current_situation(user, dealer)
  end

  def bet
    user.make_bet
    dealer.make_bet
    @bank += 20
  end

  def user_move
    choice = interface.move
    case choice
    when 1
      dealer_move
    when 2
      user.add_card(deck)
      interface.current_situation(user, dealer)
    when 3
      finish
    end
  end

  def dealer_move; end

  def finish; end

  attr_accessor :interface, :bank, :deck, :user, :dealer
end
