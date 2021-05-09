# frozen_string_literal: true

class Player
  attr_reader :hand, :bank, :score

  def initialize
    @bank = 100
    @hand = Hand.new
    @score = 0
  end

  def add_card(deck)
    raise 'Нельзя иметь больше 3-х карт' if hand.full?

    hand.add(deck.cards.shift)
    self.score = hand.score
  end

  def fold
    self.hand = Hand.new
  end

  def make_bet
    self.bank -= 10
  end

  def add(money)
    self.bank += money
  end

  protected

  attr_writer :hand, :bank, :score
end
