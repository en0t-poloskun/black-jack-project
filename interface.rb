# frozen_string_literal: true

class Interface
  def name
    print('Введите свое имя: ')
    gets.chomp
  end

  def show_cards(cards, secret, name = 'Dealer')
    print("Карты игрока #{name}:")
    if secret
      cards.each { |_card| print(' *') }
    else
      cards.each { |card| print(" #{card.value}#{card.suit}") }
    end
    print("\n")
  end

  def show_score(player)
    puts("Сумма очков игрока #{player.name}: #{player.score}")
  end

  def move
    puts("Ваш ход! \n 1. Пропустить\n 2. Добавить карту\n 3. Открыть карты\n\n")
    print('Введите номер операции: ')
    n = gets.to_i
  end
end
