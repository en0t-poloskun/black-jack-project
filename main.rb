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
    user = User.new(name)
    dealer = Dealer.new
    # game
    deck = Deck.new
    2.times { user.add_card(deck) }
    2.times { dealer.add_card(deck) }
    interface.show_cards(user.cards, false, user.name)
    interface.show_cards(dealer.cards, true)
    interface.show_score(user)

    user.make_bet
    dealer.make_bet
    @bank += 20

    choice = interface.move
    case choice
    when 1
      # smth
    when 2
      user.add_card(d)
    when 3
      finish
    end
  end

  private

  def finish; end

  attr_accessor :interface, :bank
end
