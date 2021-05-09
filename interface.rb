# frozen_string_literal: true

class Interface
  def name
    print('Введите свое имя: ')
    gets.chomp
  end

  def distribution
    puts("\nРаздача карт...")
  end

  def bet(user, dealer, bank)
    puts("\nСтавки сделаны!")
    show_bank(user, dealer)
    puts("Призовой фонд: #{bank}")
  end

  def again?
    puts("\nИгра окончена! Хотите сыграть еще раз? [y/n]")
    case gets.chomp
    when /^y$/i
      true
    when /^n$/i
      false
    else
      raise 'Unknown command'
    end
  rescue RuntimeError => e
    puts(e.message)
    retry
  end

  def show_bank(user, dealer)
    puts("Банк игрока #{user.name}: #{user.bank}")
    puts("Банк игрока Dealer: #{dealer.bank}")
  end

  def current_situation(user, dealer)
    show_cards(user.hand.cards, false, user.name)
    show_cards(dealer.hand.cards, true)
    show_score(user.score, user.name)
  end

  def finish(user, dealer)
    puts("\nОткрываем карты...")
    show_cards(user.hand.cards, false, user.name)
    show_cards(dealer.hand.cards, false)
    show_score(user.score, user.name)
    show_score(dealer.score)
  end

  def user_move
    puts("\nВаш ход! \n 1. Пропустить\n 2. Добавить карту\n 3. Открыть карты\n\n")
    print('Введите номер операции: ')
    gets.to_i
  end

  def dealer_move(dealer)
    puts("\nХод противника!")
    if dealer.score < 17
      puts('Противник взял карту')
    else
      puts('Противник пропустил ход')
    end
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
