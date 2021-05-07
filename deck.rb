# frozen_string_literal: true

class Deck
  CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  CARD_SUITS = ['+', '<3', '^', '<>'].freeze

  attr_reader :cards

  def initialize
    @cards = []
    CARD_VALUES.each do |value|
      CARD_SUITS.each { |suit| @cards << Card.new(value, suit) }
    end
    @cards.shuffle!
  end

  private

  attr_writer :cards
end
