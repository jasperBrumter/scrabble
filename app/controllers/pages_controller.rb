class PagesController < ApplicationController

	require 'csv'

	Rails.public_path.join('french_scrabble_words.csv')

	WORDS = []
	CSV.foreach(Rails.public_path.join('french_scrabble_words.csv')) do |row|
		WORDS << row
	end


	def restart
		session[:score] = nil
	  	session[:maxscore] = nil
	  	@score = 0
	  	@maxscore = 0
	  	redirect_to root_path
	end

  def play
  	@possibleLetters = []
  	9.times {@possibleLetters << "A"}
  	2.times {@possibleLetters << "B"}
  	2.times {@possibleLetters << "C"}
  	3.times {@possibleLetters << "D"}
  	15.times {@possibleLetters << "E"}
  	2.times {@possibleLetters << "F"}
  	2.times {@possibleLetters << "G"}
  	2.times {@possibleLetters << "H"}
  	8.times {@possibleLetters << "I"}
  	1.times {@possibleLetters << "J"}
  	1.times {@possibleLetters << "K"}
  	5.times {@possibleLetters << "L"}
  	3.times {@possibleLetters << "M"}
  	6.times {@possibleLetters << "N"}
  	6.times {@possibleLetters << "O"}
  	2.times {@possibleLetters << "P"}
  	1.times {@possibleLetters << "Q"}
  	6.times {@possibleLetters << "R"}
 	6.times {@possibleLetters << "S"}
 	6.times {@possibleLetters << "T"}
 	6.times {@possibleLetters << "U"}
  	2.times {@possibleLetters << "V"}
  	1.times {@possibleLetters << "W"}
  	1.times {@possibleLetters << "X"}
  	1.times {@possibleLetters << "Y"}
  	1.times {@possibleLetters << "Z"}

  	@letters = @possibleLetters.sample(7)

  	session[:score] = 0 if session[:score].nil?
  	session[:maxscore] = 0 if session[:maxscore].nil?
  	@score = session[:score]
  	@maxscore = session[:maxscore]

  end

  def find
 
  	@letters = params["letter_array"].split(" ")

#finding all the words that have 2 characters
  	@twoarray = []
  	WORDS[0].each do |possible|
  		@yourword = params["word"].upcase.split("")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@twoarray << possible if selected == true
  	end
#finding all the words that have 3 characters
  	@threearray = []
  	WORDS[1].each do |possible|
  		@yourword = params["word"].upcase.split("")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@threearray << possible if selected == true
  	end
#finding all the words that have 4 characters
  	@fourarray = []
  	WORDS[2].each do |possible|
  		@yourword = params["word"].upcase.split("")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@fourarray << possible if selected == true
  	end
#finding all the words that have 5 characters
  	@fivearray = []
  	WORDS[3].each do |possible|
  		@yourword = params["word"].upcase.split("")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@fivearray << possible if selected == true
  	end
#finding all the words that have 6 characters
  	@sixarray = []
  	WORDS[4].each do |possible|
  		@yourword = params["word"].upcase.split("")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@sixarray << possible if selected == true
  	end
#finding all the words that have 7 characters
 	@sevenarray = []
  	WORDS[5].each do |possible|
  		@yourword = params["word"].upcase.split("")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@sevenarray << possible if selected == true
  	end
  	#finding all the words that have 8 characters
  	@eightarray = []
  	WORDS[6].each do |possible|
  		@yourword = params["word"].upcase.split("")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@eightarray << possible if selected == true
  	end
  end

  def score
  	@letters = params["letter_array"].split(" ")
  	@yourletters = params["word"].upcase.gsub(/\s+/, "")
  	@word = Word.new()

# find whether the player can properly make the word with those letters
  	@valid = true
  	@yourletters.split("").each do |letter|
  		if @letters.include?(letter)
  			@letters.delete_at(@letters.index(letter))
  		else 
			@valid = false
		end
	end
	@letters = params["letter_array"].split(" ")
	

#find all words that contain these letters
  	@twoarray = []
  	WORDS[0].each do |possible|
  		@yourword = params["letter_array"].split(" ")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@twoarray << possible if selected == true
  	end

  	@threearray = []
  	WORDS[1].each do |possible|
  		@yourword = params["letter_array"].split(" ")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@threearray << possible if selected == true
  	end

  	@fourarray = []
  	WORDS[2].each do |possible|
  		@yourword = params["letter_array"].split(" ")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@fourarray << possible if selected == true
  	end

  	@fivearray = []
  	WORDS[3].each do |possible|
  		@yourword = params["letter_array"].split(" ")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@fivearray << possible if selected == true
  	end

  	@sixarray = []
  	WORDS[4].each do |possible|
  		@yourword = params["letter_array"].split(" ")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@sixarray << possible if selected == true
  	end

 	@sevenarray = []
  	WORDS[5].each do |possible|
  		@yourword = params["letter_array"].split(" ")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@sevenarray << possible if selected == true
  	end


  	#search in the relevant word list, whether the words exist
  	# @approved = true if it exists
  	# @approved = false if not.
  	@approved = false;
  	case @yourletters.length
  	when 2
  		@approved = true if WORDS[0].include?(@yourletters)
  	when 3
  		@approved = true if WORDS[1].include?(@yourletters)
  	when 4
  		@approved = true if WORDS[2].include?(@yourletters)
  	when 5
  		@approved = true if WORDS[3].include?(@yourletters)
  	when 6
  		@approved = true if WORDS[4].include?(@yourletters)
  	when 7
  		@approved = true if WORDS[5].include?(@yourletters)
  	end


#update your score and max score
  	if @approved && @valid == true
  		@yourscore = @yourletters.length
  		session[:score] = session[:score].to_i + @yourscore
  		@score = session[:score]
  	else
  		#score remains the same
  		@score = session[:score].to_i
  	end

  	
	if @sevenarray.any?
		@thisGameScore = 7
  		session[:maxscore] = session[:maxscore].to_i + 7
  		@maxscore = session[:maxscore]
  	elsif @sixarray.any?
  		@thisGameScore = 6
  		session[:maxscore] = session[:maxscore].to_i + 6
  		@maxscore = session[:maxscore]
  	elsif @fivearray.any?
  		@thisGameScore = 5
  		session[:maxscore] = session[:maxscore].to_i + 5
  		@maxscore = session[:maxscore]
  	elsif @fourarray.any?
  		@thisGameScore = 4
  		session[:maxscore] = session[:maxscore].to_i + 4
  		@maxscore = session[:maxscore]
  	elsif @threearray.any?
  		@thisGameScore = 3
  		session[:maxscore] = session[:maxscore].to_i + 3
  		@maxscore = session[:maxscore]
  	elsif @twoarray.any?
  		@thisGameScore = 2
  		session[:maxscore] = session[:maxscore].to_i + 2
  		@maxscore = session[:maxscore]
  	end
  end


  def add
  	@word = Word.create(strongWord)
  end

  private
  def strongWord
  	params.require("word").permit(:text)
  end

end

