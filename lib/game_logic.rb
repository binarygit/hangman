#!/usr/bin/ruby

module GameLogic
  def game_logic
    input = gets.chomp
    if valid?(input)
      is_guess?(input) ? point_logic(input) : (save_game; @turns_remaining = 0)
    end
  end

  def valid?(input)
    input.length == 1 && input.match?(/[a-zS]/)
  end

  def is_guess?(guess)
    guess.match?(/[a-z]/)
  end

  def point_logic(guess)
    if new_letter?(guess)
      in_mystery_word?(guess) ? replace_dash_with_letter(guess) : @turns_remaining -= 1
      update_guessed_letters(guess)
      check_win
    end
  end

  def new_letter?(guess)
    !guessed_letters.include?(guess)
  end

  def in_mystery_word?(guess)
    mystery_word.include?(guess)
  end

  def replace_dash_with_letter(guess)
    letter_index_in_mystery_word = mystery_word.each_index.select { |i| mystery_word[i] == guess }
    guess = ' ' + guess + ' '
    letter_index_in_mystery_word.each do |i|
      dash_row.insert(i, guess)
      dash_row.slice!(i + 1)
    end
  end

  def update_guessed_letters(guess)
    guessed_letters.push(guess) unless guessed_letters.include?(guess)
  end

  def check_win
    if dash_row.join.delete(' ') == mystery_word.join
      display_win_screen
      @turns_remaining = 0
    elsif turns_remaining == 0
      display_lose_screen
    end
  end
end
