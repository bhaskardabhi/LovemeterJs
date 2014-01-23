explodeString = (array) ->
	###
		Example: ["abc d", "a", "a b c d"] -> ["a","b", "c", "d", "a", "a", "b", "c", "d"];
	###
	array.join('').replace(/\s+/g, '').split('')

@lovemeter = (partner1, partner2) ->

	if not (partner1?.length and partner2?.length)
		return 0

	###
		Making Args array and adding "loves" on between two partner name  Example:
			["Partner 1", "loves", "Partner 2"]
	###
	wordsArray = [partner1, "loves", partner2]

	### Converting Array to characters	###

	charArray = explodeString wordsArray

	###
		Counting Repeatation of Character in String
	###

	wordCount = [] # Result Array

	###
		Iterating over Each character and removing it as its count is finished and at the end we gonna get empty Array
	###

	until charArray.length is 0

		count = 1

		i = 1
		# Iterating over each character in array and Finding Its Count
		until i is charArray.length
			if charArray[0] is charArray[i]
				count++
				charArray.splice(i, 1)
			else
				i++

		charArray.splice(0, 1)
		wordCount.push count

	###
		Doing Addition of Words Count to get Result in Range of 0 to 100
	###

	until wordCount.length is 2

		tempResult = []
		lenArray = wordCount.length

		###
			For ideal love which is myth ;)
		###

		if lenArray is 3 and lenArray[1] is 0 and lenArray[0] + lenArray[2] == 10
				wordCount = [0, 100]
				break

		for i in [0...lenArray/2]

			# Special Case for Odd Array Middle Element

			if lenArray%2 == 1 and i == Math.floor(lenArray/2)
				tempResult.push wordCount[i]
				wordCount = tempResult
				break

			sumFirstLast = wordCount[i] + wordCount[lenArray-i-1]

			###
				Determine if sum is less or greater then 10
				if less then 0 then push int
				else split both digit and push seperatly
			###

			if sumFirstLast <= 10
				tempResult.push sumFirstLast
			else
				# First Digit will always be 1
				tempResult.push 1
				tempResult.push sumFirstLast%10

		wordCount = tempResult

	return wordCount[0] * 10 + wordCount[1]
