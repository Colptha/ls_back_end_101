require 'io/console'

DISPLAY_CHOICES = %w(rock(r) paper(p) scissors(x) lizard(l) spock(s))
VALID_CHOICES = %w(r p x l s)
WINNING_COMBOS = %w(xp xl pr ps rl rx ls lp sr sx)
REQUIRED_WINS = 5

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def wait_for_key_press
  prompt 'Press any key to continue.'
  STDIN.getch
end

def prompt_choice
  loop do
    prompt "Choose one: #{DISPLAY_CHOICES.join(', ')}"
    choice = gets.chomp.strip.downcase
    if VALID_CHOICES.include?(choice) then return choice end
    prompt "That's not a valid choice."
  end
end

def generate_choice
  VALID_CHOICES.sample
end

def determine_winner(player, computer)
  winner = 'player' if WINNING_COMBOS.include?(player + computer)
  winner = 'computer' if WINNING_COMBOS.include?(computer + player)
  winner ? winner : 'tie'
end

def display_choices(p_choice, c_choice)
  prompt "Player chose: #{p_choice}\n=> Computer chose: #{c_choice}"
end

def display_result(winner)
  if winner == 'tie'
    prompt "It's a tie!"
  else
    prompt "#{winner.capitalize} wins!"
  end
end

def play_again?
  loop do
    prompt "Would you like to play again (y/n)?"
    answer = gets.chomp.downcase.strip
    if %w(y yes yeah sure).include?(answer) then return true end
    if %w(n no nope uhuh).include?(answer) then return false end
    prompt "That's not a valid choice."
  end
end

def update_score(scores, winner)
  scores[winner] += 1
end

def winner?(scores)
  scores.value?(REQUIRED_WINS)
end

def display_winner(scores)
  prompt "#{scores.key(5).capitalize} is the first to #{REQUIRED_WINS} wins!"
end

def display_score(scores)
  puts ''
  scores.values_at('player', 'computer').each do |score|
    prompt "#{scores.key(score)} score: #{score}"
  end
  puts ''
end

loop do
  scores = { 'player' => 0, 'computer' => 0, 'tie' => 0 }

  loop do
    clear_screen
    player_choice = prompt_choice
    computer_choice = generate_choice

    display_choices(player_choice, computer_choice)

    winner = determine_winner(player_choice, computer_choice)

    display_result(winner)
    update_score(scores, winner)
    display_score(scores)

    break if winner?(scores)
    wait_for_key_press
  end

  display_winner(scores)
  break unless play_again?
end

prompt "Thank you for playing!"
