json.set! :data do
	json.set! :letters do
		json.array! @letters
	end
	json.set! :eights do
		json.array! @eightarray
	end
	json.set! :sevens do
		json.array! @sevenarray
	end
	json.set! :sixes do
		json.array! @sixarray
	end
	json.set! :fives do
		json.array! @fivearray
	end
	json.set! :fours do
		json.array! @fourarray
	end
	json.set! :threes do
		json.array! @threearray
	end
	json.set! :twos do
		json.array! @twoarray
	end
	json.set! :ones do
		json.array! @onearray
	end
end