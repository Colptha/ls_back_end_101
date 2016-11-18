SUITS = ['H', 'D', 'S', 'C'].freeze
VALUES = (['2', '3', '4', '5', '6', '7'] +
         ['8', '9', '10', 'J', 'Q', 'K', 'A']).freeze

def prompt(msg)
  puts "=>" + msg
end

def initialize_deck
  deck = []
  SUITS.each do |suit|
    VALUES.each do |value|
      deck << [suit, value]
    end
  end
  deck.shuffle
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += 11 if value == 'A' # A
    sum += 10 if value.to_i.zero? # J, Q, K
    sum += value.to_i if value.to_i >= 2 && value.to_i <= 10
  end

  # correct for Aces
  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def hit(cards, deck)
  cards << deck.shift
  cards
end

def dealer_turn(cards, deck)
  loop do
    return if total(cards) >= 17
    hit(cards, deck)
  end
end

def current_cards(cards)
  hand = ""
  cards.each do |card|
    hand << "#{card} "
  end
  hand << "for a total of " + total(cards).to_s
  hand
end

def player_turn(cards, deck)
  loop do
    prompt "Would you like to hit or stay?"
    answer = gets.chomp.downcase

    hit(cards, deck) if answer == 'hit' || answer == 'h'
    break if answer == 'stay' || answer == 's'
    break if busted?(cards)
    prompt "Player has " + current_cards(cards)
  end
end

def busted?(cards)
  total(cards) > 21
end

def replay?
  loop do
    prompt "Another game?"
    response = gets.chomp.downcase
    return true if response == 'y' || response == 'yes'
    return false if response == 'n' || response == 'no'
    prompt "Please enter (y/n)"
  end
end

# begin program
system 'clear'
prompt "Welcome to 21"
sleep 1.5

loop do
  player_cards = []
  dealer_cards = []
  deck = initialize_deck

  2.times do
    player_cards << deck.shift
    dealer_cards << deck.shift
  end
  system 'clear'

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "Player has " + current_cards(player_cards)
  player_turn(player_cards, deck)
  dealer_turn(dealer_cards, deck)
  system 'clear'
  if busted?(player_cards)
    prompt "You busted!"
  elsif busted?(dealer_cards)
    prompt "Dealer busted, you won!"
  else
    prompt "You chose to stay!"
    prompt "Dealer has " + current_cards(dealer_cards)
    prompt "Player has " + current_cards(player_cards)

    if total(player_cards) > total(dealer_cards)
      prompt "You win!"
    elsif total(dealer_cards) > total(player_cards)
      prompt "Dealer wins!"
    else
      prompt "It's a tie!"
    end

  end

  break unless replay?
end

prompt "Thanks for playing!"
