require_relative 'ui'
require_relative 'rank'

def choose_secret_word
	dictionary_words = File.read "dictionary.txt"
	dictionary_words = dictionary_words.split "\n"
	random_position = rand dictionary_words.size
	secret_word = dictionary_words[random_position].downcase
end

def choose_secret_word_optimized
	dictionary_file = File.new "dictionary.txt"
	dictionary_size = dictionary_file.gets.to_i
	random_position = rand dictionary_size
	for c in 1..(random_position-1)
		dictionary_file.gets
	end
	secret_word = dictionary_file.gets.strip.downcase
	dictionary_file.close
	secret_word
end

def play(secret_word)
	errors = 0
	kicks = []
	total_score = 0

	while errors < 5

		if kicks.size > 0
			show_kicks_already_done kicks
		end

		user_try = give_it_a_shot calculate_masked_word secret_word, kicks

		if kicks.include? user_try
			inform_kick_already_done
			next
		end

		kicks << user_try

		if(user_try.size > 1)
			#Tried the whole word
			if(secret_word == user_try)
				inform_correct
				total_score += 100
				return total_score
			else
				inform_incorrect
				errors += 1
			end
		else
			letter_count = secret_word.count user_try
			if(letter_count > 0)
				inform_letter_match letter_count
			else
				inform_incorrect
				errors += 1
			end
		end
	end

	total_score -= 30

	inform_game_over

	total_score
end

def calculate_masked_word secret_word, kicks
	masked_word = "";
	for c in secret_word.chars
		if kicks.include? c
			masked_word << c
		else
			masked_word << "_"
		end
	end
	masked_word
end

def hangman_game

	player_name = say_welcome
	total_score = 0
	top_score = 0

	rank = read_rank
	show_rank rank

	if rank != nil
		top_score = rank[1]
	end

	loop do
		secret_word = choose_secret_word_optimized

		total_score += play secret_word

		if total_score > top_score.to_i
			write_rank player_name, total_score
		end

		if !play_again?
			break
		end
	end
end
