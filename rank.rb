$rank_file_name = "rank.txt"

def read_rank
	if File.exist? $rank_file_name
		rank_content = File.read $rank_file_name
		rank_content = rank_content.split "\n"
	end
	rank_content
end

def write_rank player_name, total_score
		File.write $rank_file_name, "#{player_name}\n#{total_score}"
end
