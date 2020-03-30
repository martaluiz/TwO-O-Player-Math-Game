require_relative 'players'
require_relative 'questions'

print "Player 1's name: "
p1_name = gets.chomp
print "Player 2's name: "
p2_name = gets.chomp

player1 = Players.new(p1_name)
player2 = Players.new(p2_name)

current_player = 1

puts "****************************************"
puts "||                                    ||"
puts "|| Welcome to Two-O-Player Math Game! ||"
puts "||                                    ||"
puts "****************************************"


while (player1.alive? && player2.alive?) do
	
  player = (current_player == 1) ? player1 : player2

  question = Questions.new()

  puts "**********NEW TURN***********"

  puts "#{player.name}: #{question.print}"
 

  answer = gets.chomp.to_i

  if answer == question.answer
  puts  "That is correct! Well done!"
  puts "#{player1.name} #{player1.lives}/3 lives and #{player2.name} #{player2.lives}/3 lives"
  else
    player.lives -= 1
    puts "Oops!!! That is just wrong!"
    puts "#{player1.name} #{player1.lives}/3 lives and #{player2.name} #{player2.lives}/3 lives"
  end
  current_player = (current_player + 1) % 2
end

if player1.lives == 0
   puts "Player 2 wins with a score of #{player2.name} wins with #{player2.lives}/3 lives"
elsif player2.lives == 0
   puts "Player 1 wins with a score of #{player1.name} #{player1.lives}/3 lives"
end

puts "**********GAME OVER***********"
