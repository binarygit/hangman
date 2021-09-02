#!/usr/bin/ruby

class Hangman
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
    clear_screen
    puts 'yeah'
  end

  def saved_games?
    pwd = Dir.pwd
    !Dir.empty?('saved_games')
  end

  def display_main_menu
    clear_screen
    print "\n Hello and Welcome to Hangman\n" +
          "\n 1) New Game\n" +
          " 2) Load Game\n\n" +
          " "
  end

  def clear_screen
    system('clear') || system('cls')
  end
end

Hangman.new.open
