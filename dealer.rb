# frozen_string_literal: true

class Dealer < Player
  def move(deck)
    add_card(deck) if score < 17
  end

  def make_bet
    raise 'У Dealer нет денег для продолжения игры' if bank < 10

    super
  end
end
