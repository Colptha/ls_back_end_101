# scissors beats paper and lizard
# paper beats rock and spock
# rock beats lizard and scissors
# lizard beats spock and paper
# spock beats rock and scissors
require 'pry'
CHOSEN = { 'r' => 'rock',
           'p' => 'paper',
           'x' => 'scissors',
           'l' => 'lizard',
           's' => 'Spock' }
GAME_CHOICES = %w(rock(r) paper(p) scissors(x) lizard(l) Spock(s))
VALID_CHOICES = %w(r p x l s)
WINNING_COMBINATION = %w(rl rx pr ps xp xl ls lp sr sx)
VALID_YES_NO = %w(y yes no n)

def prompt(message)
  puts "=> #{message}"
end

def determine_choices(choice, computer_choice)
  input_valid_choice(choice)
  computer_choice[0] = VALID_CHOICES.sample
  display_choices(choice[0], computer_choice[0])
end

def input_valid_choice(choice)
  loop do
    prompt "Choose one: #{GAME_CHOICES.join(', ')}"
    choice[0] = gets.chomp
    break if VALID_CHOICES.include?(choice[0])
    prompt("That's not a valid choice.")
  end
end

def display_choices(choice, computer_choice)
  prompt "You chose: #{CHOSEN[choice]}"
  prompt "Computer chose: #{CHOSEN[computer_choice]}"
end

def determine_results(player, computer)
  if WINNING_COMBINATION.include?("#{player[0]}#{computer[0]}")
    "You won!"
  elsif WINNING_COMBINATION.include?("#{computer[0]}#{player[0]}")
    "You lost!"
  else
    "It's a tie!"
  end
end

def determine_score(result, score)
  tally(result, score)
  display_score(score)
end

def tally(result, score)
  if result == "You won!"
    score[:player] += 1
  elsif result == "You lost!"
    score[:computer] += 1
  end
end

def display_score(score)
  prompt "Player: #{score[:player]}. " \
         "Computer: #{score[:computer]}."
end

def winner?(score)
  if player_win?(score)
    true
  elsif computer_win?(score)
    true
  else
    false
  end
end

def player_win?(score)
  player_wins = score[:player] == 5
  display_win if player_wins
  player_wins
end

def computer_win?(score)
  computer_wins = score[:computer] == 5
  display_loss if computer_wins
  computer_wins
end

def display_win
  prompt "You are victorious!"
end

def display_loss
  prompt "Defeat!"
end

def rerun?
  prompt "Do you want to play again?"
  answer = input_valid_yes_no
  answer.start_with?('y')
end

def input_valid_yes_no
  answer = nil
  loop do
    answer = gets.chomp.downcase
    break if VALID_YES_NO.include?(answer)
    prompt "Please enter (Y/N)"
  end
  answer
end

prompt "Welcome to rock, paper, scissors, lizard, Spock!"

loop do # main loop
  score = { player: 0, computer: 0 }
  loop do
    choice = [nil]
    computer_choice = [nil]

    determine_choices(choice, computer_choice)

    prompt result = determine_results(choice, computer_choice)

    determine_score(result, score)

    break if winner?(score)
  end
  break unless rerun?
end

prompt "Good-bye!"
