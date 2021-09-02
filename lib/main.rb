#!/usr/bin/ruby
require 'pry-byebug'
require_relative 'display.rb'

class Hangman
  include Display
  attr_reader :turns_remaining, :mystery_word
  attr_reader :guessed_letters, :dash_row

  def initialize
    @turns_remaining = 6
    @mystery_word = fetch_word
    @guessed_letters = []
    @dash_row = Array.new(mystery_word.length) {' _ '}
  end

  def fetch_word
    File.open('words.txt', 'r').readlines[rand(61000)].split('')[0..-2]
  end

  def open
    display_main_menu
    choose_mode
    play_game
  end

  def choose_mode
    loop do
      mode = gets.chomp
      if mode == '1'
        break
      elsif mode == '2'
        if saved_games?
          load_game
          break
        else
          print " sorry, there are no saved games to load from\n "
        end
      end
    end
  end

  def play_game
    while turns_remaining > 0
      clear_display
      display_game_screen
      guess = gets.chomp
      save_game if guess == 'S'
      if valid?(guess)
        if mystery_word.include?(guess) && !guessed_letters.include?(guess)
          replace_dash_with_letter(guess) 
        else
          @turns_remaining -= 1 unless guessed_letters.include?(guess)
        end
        update_guessed_letters(guess)
      else
        next
      end
      display_win_screen if dash_row == mystery_word
    end
    display_lose_screen
  end

  def update_guessed_letters(guess)
    guessed_letters.push(guess) unless guessed_letters.include?(guess)
  end


  def replace_dash_with_letter(guess)
    letter_index_in_mystery_word = mystery_word.each_index.select {|i| mystery_word[i] == guess}
    guess = ' ' + guess + ' '
    letter_index_in_mystery_word.each do |i|
      dash_row.insert(i, guess)
      dash_row.slice!(i + 1)
    end
  end

  def valid?(guess)
    guess.length == 1 && guess.match(/[a-z]/)
  end


  def saved_games?
    pwd = Dir.pwd
    !Dir.empty?('saved_games')
  end

end

Hangman.new.open
