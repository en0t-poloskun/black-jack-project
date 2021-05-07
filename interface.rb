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
    show_score(user.score, user.name)
  end

  def finish(user, dealer)
    show_cards(user.cards, false, user.name)
    show_cards(dealer.cards, false)
    show_score(user.score, user.name)
    show_score(dealer.score)
  end

  def move
    puts("\nВаш ход! \n 1. Пропустить\n 2. Добавить карту\n 3. Открыть карты\n\n")
    print('Введите номер операции: ')
    gets.to_i
  end

  def announce(winner)
    if winner.nil?
      puts("\nНичья!")
    elsif winner.instance_of?(User)
      puts("\nВы победили!")
    elsif winner.instance_of?(Dealer)
      puts("\nВы проиграли...")
    end
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

  def show_score(score, name = 'Dealer')
    puts("\nСумма очков игрока #{name}: #{score}")
  end
end
