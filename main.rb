# frozen_string_literal: true

require_relative 'hand'
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
    loop do
      game
      break unless interface.again?
    end
  end

  private

  def game
    bet
    distribution
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
    interface.bet(user, dealer, bank)
  rescue RuntimeError => e
    abort e.message
  end

  def user_move
    choice = user.hand.full? && dealer.hand.full? ? 3 : interface.user_move
    case choice
    when 1
      dealer_move
    when 2
      add_card
    when 3
      finish
    else
      raise 'Unknown command'
    end
  rescue RuntimeError => e
    puts(e.message)
    retry
  end

  def dealer_move
    interface.dealer_move(dealer)
    dealer.move(deck)
    user_move
  end

  def finish
    interface.finish(user, dealer)
    winner = choose_winner
    if winner.nil?
      user.add(bank / 2)
      dealer.add(bank / 2)
    else
      winner.add(bank)
    end
    nullify
    interface.announce(winner)
    interface.show_bank(user, dealer)
  end

  def choose_winner
    return if (user.score > 21) && (dealer.score > 21)

    if user.score > 21
      dealer
    elsif dealer.score > 21
      user
    elsif user.score > dealer.score
      user
    elsif dealer.score > user.score
      dealer
    end
  end

  def add_card
    user.add_card(deck)
    interface.current_situation(user, dealer)
    dealer.hand.full? ? finish : dealer_move
  end

  def nullify
    self.bank = 0
    user.fold
    dealer.fold
  end

  attr_accessor :interface, :bank, :deck, :user, :dealer
end
