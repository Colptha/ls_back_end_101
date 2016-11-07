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
GAME_CHOICES = %w[rock(r) paper(p) scissors(x) lizard(l) Spock(s)]
VALID_CHOICES = %w[r p x l s]
WINNING_COMBINATION = %w[rl rx pr ps xp xl ls lp sr sx]
VALID_YES_NO = %w[y yes no n]

def prompt(message)
  puts "=> #{message}"
end

def player_choice(choice)
  loop do
    prompt "Choose one: #{GAME_CHOICES.join(', ')}"
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end
  choice
end


def display_choices(choice, computer_choice)
  prompt "You chose: #{CHOSEN[choice]}"
  prompt "Computer chose: #{CHOSEN[computer_choice]}"
end

def determine_results(player, computer)
  if WINNING_COMBINATION.include?("#{player}#{computer}")
    "You won!"
  elsif WINNING_COMBINATION.include?("#{computer}#{player}")
    "You lost!"
  else
    "It's a tie!"
  end
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
  if score[:player] == 5
    "You are victorious!"
  elsif score[:computer] == 5
    "Defeat!"
  end
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
    choice = player_choice(choice)
    computer_choice = VALID_CHOICES.sample

    display_choices(choice, computer_choice)

    prompt result = determine_results(choice, computer_choice)

    tally(result, score)
    
    display_score(score)

    winner = winner?(score)

    prompt winner if winner

    break if winner
  end
  break unless rerun?
end

prompt "Good-bye!"
