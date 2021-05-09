# frozen_string_literal: true

class Hand
  attr_reader :cards

  def initialize
    @cards = []
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

  def full?
    cards.size > 2
  end

  def add(card)
    cards << card
  end

  private

  attr_writer :cards

  def add_aces(score, aces)
    if score + 11 + (aces - 1) * 1 <= 21
      score + 11 + (aces - 1) * 1
    else
      score + aces * 1
    end
  end
end
