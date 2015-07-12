
word_to_guess = File.readlines('words.txt').map { |word| word.strip }.sample

#puts word_to_guess

letters_successfully_guessed = []

lives = 7

art = [
  <<-ART ,
/----
|   |
|
|
|
|
--------
  ART
  <<-ART ,
/----
|   |
|   O
|
|
|
--------
  ART
  <<-ART ,
/----
|   |
|   O
|   |
|
|
--------
  ART
  <<-ART ,
/----
|   |
|   O
|  /|
|
|
--------
  ART
  <<-ART ,
/----
|   |
|   O
|  /|\\
|
|
--------
  ART
  <<-ART ,
/----
|   |
|   O
|  /|\\
|  /
|
--------
  ART
  <<-ART ,
/----
|   |
|   O
|  /|\\
|  / \\
|
--------
  ART
]

while lives > 0 && ((word_to_guess.chars - letters_successfully_guessed).any?)
	word_to_display = word_to_guess.chars.map do |character|
		if letters_successfully_guessed.include? character
			character
		else
			"_" 
		end
	end.join(" ")
    puts art[7-lives]
	puts word_to_display
	letter_guessed = gets.strip
	if word_to_guess.include? letter_guessed
		letters_successfully_guessed << letter_guessed
    else
        lives -= 1
	end
end

puts "The word to guess was '#{word_to_guess}'"

if lives == 0
    puts "You lost"
else
    puts "You won"
end