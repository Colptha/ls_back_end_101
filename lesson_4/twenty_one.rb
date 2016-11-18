SUITS = ['H', 'D', 'S', 'C'].freeze
VALUES = (('2'..'10').to_a + ['J', 'Q', 'K', 'A']).freeze

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += 11 if value == 'A'
    sum += 10 if value.to_i.zero?
    sum += value.to_i unless value.to_i.zero?
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  total(cards) > 21
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  return :player_busted if player_total > 21
  return :dealer_busted if dealer_total > 21
  return :player if player_total > dealer_total
  return :dealer if dealer_total > player_total
  :tie
end

def display_results(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  loop do
    puts "-------------"
    prompt "Do you want to play again? (y/n)"
    answer = gets.chomp.downcase
    break if ['y', 'yes'].include?(answer)
    return false if ['n', 'no'].include?(answer)
    prompt "Sorry, you must enter either 'y' or 'n'"
  end
  true
end

def display_initial_hands(dealer_cards, player_cards)
  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, \
for a total of #{total(player_cards)}."
end

def hit(hand, deck)
  hand << deck.pop
end

def deal_cards(player_cards, dealer_cards, deck)
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
end

def display_hand_after_hit(player_cards)
  prompt "You chose to hit!"
  prompt "Your cards are now: #{player_cards}"
  prompt "Your total is now: #{total(player_cards)}"
end

def hit_or_stay
  player_turn = nil
  loop do
    prompt "Would you like to (h)it or (s)tay?"
    player_turn = gets.chomp.downcase
    break if ['h', 's'].include?(player_turn)
    prompt "Sorry, must enter 'h' or 's'."
  end
  player_turn
end

system 'clear'
prompt "Welcome to Twenty-One!"
sleep 1.5

loop do
  system 'clear'
  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  deal_cards(player_cards, dealer_cards, deck)

  display_initial_hands(dealer_cards, player_cards)

  # player turn
  loop do
    player_turn = hit_or_stay

    hit(player_cards, deck) if player_turn == 'h'
    display_hand_after_hit(player_cards) if player_turn == 'h'

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    display_results(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "You stayed at #{total(player_cards)}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if busted?(dealer_cards) || total(dealer_cards) >= 17

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_cards)
    prompt "Dealer total is now: #{total(dealer_cards)}"
    display_results(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{total(dealer_cards)}"
  end

  # both player and dealer stay - compare cards!
  puts "================"
  prompt "Dealer total: #{total(dealer_cards)} with #{dealer_cards}"
  prompt "Player total: #{total(player_cards)} with #{player_cards}"
  puts "================"

  display_results(dealer_cards, player_cards)

  break unless play_again?
end

system 'clear'
prompt "Thank you for playing Twenty-One! Good bye!"
