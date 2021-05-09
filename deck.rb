# frozen_string_literal: true

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card::CARD_VALUES.each do |value|
      Card::CARD_SUITS.each { |suit| @cards << Card.new(value, suit) }
    end
    @cards.shuffle!
  end

  private

  attr_writer :cards
end
