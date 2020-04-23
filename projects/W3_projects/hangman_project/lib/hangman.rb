class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    #can't call self within a method? only as a class method
    @secret_word = Hangman.random_word
    @guess_word = ["_"] * @secret_word.length
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word    
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    end
    false
  end

  def get_matching_indices(char)
    found = []

    @secret_word.each_char.with_index do |ele, ind|
      if char == ele
        found << ind
      end
    end
    found
  end

  def fill_indices(char, ind_arr)
    @guess_word.each.with_index do |ele, ind|
      if ind_arr.include?(ind)
        @guess_word[ind] = char
      end
    end
  end

  def try_guess(char)
    
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    else
      @attempted_chars << char
      found = get_matching_indices(char)
      @remaining_incorrect_guesses -= 1 if found.empty?
      fill_indices(char, found)
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char"
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    end
    false
  end

end
