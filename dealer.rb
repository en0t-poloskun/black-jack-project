# frozen_string_literal: true

class Dealer < Player
  def move(deck)
    add_card(deck) if score < 17
  end
end
