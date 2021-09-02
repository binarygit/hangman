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
    binding.pry
    while turns_remaining > 0
      print turns_remaining
      turns_remaining -= 6
    end
  end


  def saved_games?
    pwd = Dir.pwd
    !Dir.empty?('saved_games')
  end

end

Hangman.new.open
