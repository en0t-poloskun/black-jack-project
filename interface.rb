# frozen_string_literal: true

class Interface
  def name
    print('Введите свое имя: ')
    gets.chomp
  end

  def distribution
    puts("\nРаздача карт...")
  end

  def current_situation(user, dealer)
    show_cards(user.cards, false, user.name)
    show_cards(dealer.cards, true)
    show_score(user)
  end

  def move
    puts("\nВаш ход! \n 1. Пропустить\n 2. Добавить карту\n 3. Открыть карты\n\n")
    print('Введите номер операции: ')
    gets.to_i
  end

  private

  def show_cards(cards, secret, name = 'Dealer')
    print("\nКарты игрока #{name}:")
    if secret
      cards.each { |_card| print(' *') }
    else
      cards.each { |card| print(" #{card.value}#{card.suit}") }
    end
    print("\n")
  end

  def show_score(player)
    puts("\nСумма очков игрока #{player.name}: #{player.score}")
  end
end
