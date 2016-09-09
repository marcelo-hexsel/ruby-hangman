
def	say_welcome
	puts "Welcome to the Ruby Hangman Game!"
	puts "\n\nWhat's your name?"
	player_name = gets.strip
end

def choose_secret_word
	secret_word = "eclipse".downcase
	puts "\n\nThe secret word has #{secret_word.size} characters. Good luck!"
	secret_word
end

def play_again?
	puts "Wanna play again? (y/n)"
	gets.strip.downcase == "y"
end 

def play(secret_word)
	errors = 0
	kicks = []

	while errors < 5
		
		if kicks.size > 0
			puts "Kicks already done #{kicks}\n"
		end
		
		puts "Give it a shot!"
		user_try = gets.strip.downcase
		
		if kicks.include? user_try
			puts "You've already tried that!"
			next
		end
		
		kicks << user_try
		
		if(user_try.size > 1)
			#Tried the whole word
			if(secret_word == user_try)
				puts "Correct! =]"
				return
			else 
				puts "Sorry, try again..."
				errors += 1		
			end	
		else
			letter_count = secret_word.count user_try
			if(letter_count > 0)
				puts "This lettter occurs #{letter_count} times on the secret word!"
			else
				puts "Sorry, try again..."
				errors += 1
			end
		end
	end

	puts "Sorry, no more tries...game over!"
end

player_name = say_welcome
secret_word = choose_secret_word

loop do 
	play secret_word
	if !play_again?
		break
	end

end