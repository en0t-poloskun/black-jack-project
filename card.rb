# frozen_string_literal: true

class Card
  CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  CARD_SUITS = ['+', '<3', '^', '<>'].freeze

  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end
end
