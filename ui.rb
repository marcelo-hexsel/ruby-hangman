
def	show_rank rank_content
		if rank_content != nil
			puts "Top score is: #{rank_content[0]}, #{rank_content[1]} points!"
		else
			puts "No top score registered!"
		end
end

def	say_welcome
	puts "Welcome to the Ruby Hangman Game!"
	puts "\n\nWhat's your name?"
	player_name = gets.strip
end

def play_again?
	puts "Wanna play again? (y/n)"
	gets.strip.downcase == "y"
end

def show_kicks_already_done kicks
  puts "Kicks already done #{kicks}\n"
end

def give_it_a_shot masked_word
  puts "Give it a shot! The word is: #{masked_word}"
  gets.strip.downcase
end

def kick_already_done
  puts "You've already tried that!"
end

def inform_correct
  puts "Correct! =]"
end

def inform_incorrect
  puts "Sorry, try again..."
end

def inform_letter_match letter_count
  puts "This lettter occurs #{letter_count} times on the secret word!"
end

def inform_game_over
  puts "Sorry, no more tries...game over!"
end
