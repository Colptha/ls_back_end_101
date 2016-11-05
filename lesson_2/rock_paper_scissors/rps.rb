VALID_CHOICES = %w(rock paper scissors)
WINNING_COMBINATION = %w(rockscissors paperrock scissorspaper)
LOSING_COMBINATION = %w(rockpaper paperscissors scissorsrock)
VALID_YES_NO = %w(y yes no n)
def display_results(player, computer)
  if WINNING_COMBINATION.include?("#{player}#{computer}")
    prompt("You won!")
  elsif LOSING_COMBINATION.include?("#{player}#{computer}")
    prompt("You lost!")
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  puts "=> #{message}"
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

loop do
  choice = nil
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt "You chose: #{choice}; Computer chose: #{computer_choice}"

  display_results(choice, computer_choice)

  prompt "Do you want to play again?"
  answer = input_valid_yes_no
  break unless answer.start_with?('y')
end

prompt "Good-bye!"
