class Api::V1::FrenchController < Api::V1::BaseController
	require 'csv'

	Rails.public_path.join('french_scrabble_words.csv')

	WORDS = [[],['A','C','D','J','L','M','N','O','S','T','Z']]
	CSV.foreach(Rails.public_path.join('french_scrabble_words.csv')) do |row|
		WORDS << row
	end

	def mots
		@letters = params["q"].upcase.split("")
#finding all the words that have 1 characters
    @onearray = []
    WORDS[1].each do |possible|
      @yourword = params["q"].upcase.split("")
      selected = true;
      possible.split("").each do |char|
        selected = false unless @yourword.include?(char)
        @yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
      end
      @onearray << possible if selected == true
    end
#finding all the words that have 2 characters
  	@twoarray = []
  	WORDS[2].each do |possible|
  		@yourword = params["q"].upcase.split("")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@twoarray << possible if selected == true
  	end
#finding all the words that have 3 characters
  	@threearray = []
  	WORDS[3].each do |possible|
  		@yourword = params["q"].upcase.split("")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@threearray << possible if selected == true
  	end
#finding all the words that have 4 characters
  	@fourarray = []
  	WORDS[4].each do |possible|
  		@yourword = params["q"].upcase.split("")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@fourarray << possible if selected == true
  	end
#finding all the words that have 5 characters
  	@fivearray = []
  	WORDS[5].each do |possible|
  		@yourword = params["q"].upcase.split("")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@fivearray << possible if selected == true
  	end
#finding all the words that have 6 characters
  	@sixarray = []
  	WORDS[6].each do |possible|
  		@yourword = params["q"].upcase.split("")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@sixarray << possible if selected == true
  	end
#finding all the words that have 7 characters
 	@sevenarray = []
  	WORDS[7].each do |possible|
  		@yourword = params["q"].upcase.split("")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@sevenarray << possible if selected == true
  	end
  	#finding all the words that have 8 characters
  	@eightarray = []
  	WORDS[8].each do |possible|
  		@yourword = params["q"].upcase.split("")
  		selected = true;
  		possible.split("").each do |char|
  			selected = false unless @yourword.include?(char)
  			@yourword.delete_at(@yourword.index(char)) if @yourword.include?(char)
  		end
  		@eightarray << possible if selected == true
  	end
	end

	def resultat
    @word = params["q"].upcase
    case @word.length
      when 8
        @valid = WORDS[8].include?(@word)
      when 7
        @valid = WORDS[7].include?(@word)
      when 6
        @valid = WORDS[6].include?(@word)
      when 5
        @valid = WORDS[5].include?(@word)
      when 4
        @valid = WORDS[4].include?(@word)
      when 3
        @valid = WORDS[3].include?(@word)
      when 2
        @valid = WORDS[2].include?(@word)
      when 1
        @valid = WORDS[1].include?(@word)
    end
	end

	

	def lettres
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
		@lettres = @possibleLetters.sample(7)
	end


end