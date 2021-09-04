#!/usr/bin/ruby
require 'pry-byebug'
require_relative 'display.rb'
require_relative 'game_logic'
require_relative 'save_game'
require_relative 'load_game'

class Hangman
  include Display
  include GameLogic
  include SaveGame
  include LoadGame
  attr_reader :turns_remaining, :mystery_word
  attr_reader :guessed_letters, :dash_row

  def initialize
    @turns_remaining = 6
    @mystery_word = fetch_word
    @guessed_letters = []
    @dash_row = Array.new(mystery_word.length) { ' _ ' }
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
      break if mode == '1'

      if mode == '2'
        if saved_games?
          return load_game
        else
          print " sorry, there are no saved games to load from\n "
        end
      end
    end
  end

  def play_game
    while turns_remaining.positive?
      clear_display
      display_game_screen
      game_logic
    end
  end
end

Hangman.new.open
