# scissors beats paper and lizard
# paper beats rock and spock
# rock beats lizard and scissors
# lizard beats spock and paper
# spock beats rock and scissors
DISPLAY_CHOICES = %w(rock(r) paper(p) scissors(x) lizard(l) spock(s))
VALID_CHOICES = %w(r p x l s)
WINNING_COMBO = %w(xp xl pr ps rl rx ls lp sr sx)
WINNING_NUMBER = 5


def prompt(msg)
  puts "=> #{msg}"
end

def prompt_choice
  loop do
    prompt "Choose one: #{DISPLAY_CHOICES.join(', ')}"
    choice = gets.chomp
    if VALID_CHOICES.include?(choice) then return choice end
    prompt "That's not a valid choice."
  end
end

def generate_choice
  VALID_CHOICES.sample
end

def determine_winner(player, computer)
  winner = 'player' if WINNING_COMBO.include?(player + computer)
  winner = 'computer' if WINNING_COMBO.include?(computer + player)
  return winner ? winner : 'tie'
end

def display_choices(p_choice, c_choice)
    prompt "Player chose: #{p_choice}\nComputer chose: #{c_choice}"
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
  scores.value?(WINNING_NUMBER)
end

def display_winner(scores)
  prompt "#{scores.key(5).capitalize} is the first to #{WINNING_NUMBER} wins!"
end

def display_score(scores)
  puts ''
  scores.values_at('player', 'computer').each do |score|
    prompt "#{scores.key(score)} score: #{score}"
  end
  puts ''
end

loop do
  scores = {'player' => 0, 'computer' => 0, 'tie' => 0}

  loop do
    player_choice = prompt_choice
    computer_choice = generate_choice

    display_choices(player_choice, computer_choice)

    winner = determine_winner(player_choice, computer_choice)

    display_result(winner)
    update_score(scores, winner)
    display_score(scores)

    break if winner?(scores)
  end

  display_winner(scores)
  break unless play_again?
end

prompt "Thank you for playing!"
