# frozen_string_literal: true

class Player
  attr_reader :cards, :bank

  def initialize
    @bank = 100
    @cards = []
  end

  def add_card(deck)
    return if cards.size > 2

    cards << deck.cards.shift
  end

  def fold
    self.cards = []
  end

  def score
    score = 0
    aces = 0
    cards.each do |card|
      case card.value
      when /^\d+$/
        score += card.value.to_i
      when /^(J|Q|K)$/
        score += 10
      when 'A'
        aces += 1
      end
    end
    score = add_aces(score, aces) if aces != 0
    score
  end

  def make_bet
    self.bank -= 10
  end

  def add(money)
    self.bank += money
  end

  protected

  attr_writer :cards, :bank

  def add_aces(score, aces)
    if score + 11 + (aces - 1) * 1 <= 21
      score + 11 + (aces - 1) * 1
    else
      score + aces * 1
    end
  end
end
