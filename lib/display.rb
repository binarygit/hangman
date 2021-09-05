#!/usr/bin/ruby
require 'pry-byebug'

module Display
  def display_main_menu
    clear_display
    print "\n Hello and Welcome to Hangman\n" +
          "\n 1) New Game\n" +
          " 2) Load Game\n\n" +
          " "
  end

  def display_game_screen
    display_save_instruction
    display_turns_remaining
    display_dash_row
    display_guessed_letters
    display_prompt_for_input
  end

  def display_save_instruction
    print "\n Type 'S' to save the game"
  end

  def display_turns_remaining
    print "\n num of turns left: #{turns_remaining}\n"
  end

  def display_dash_row
    print ' '
    dash_row.each { |dash| print dash }
    print "\n"
  end

  def display_guessed_letters
    print "\n Letters already guessed:"
    guessed_letters.each { |i| print ' ', i, ' ' }
    print "\n"
  end

  def display_prompt_for_input
    print "\n please enter your guess: "
  end

  def display_screen(screen)
    clear_display
    print " #{which_screen?(screen)} Game\n\n"
    print " Your Saved Games:\n\n"
    list_saved_games
    print "\n\n Enter a filename, to #{which_screen?(screen)} game #{which_preposition?(screen)}: "
  end

  def which_screen?(screen)
    screen == 'load game' ? 'Load' : 'Save'
  end

  def list_saved_games
    Dir.children('saved_games').each_with_index { |dir, index| print " #{index}) #{dir}\n" }
  end

  def which_preposition?(screen)
    screen == 'load game' ? 'from' : 'in'
  end

  def display_lose_screen
    clear_display
    print "\n Sorry, you lose\n\n"
    display_dash_row
    display_guessed_letters
    print "\n The mystery word was:  "
    print mystery_word.join
    print "\n\n"
  end

  def display_win_screen
    clear_display
    print "\n Hurray, you have won\n\n"
    display_dash_row
    display_guessed_letters
    print "\n"
  end

  def clear_display
    system('clear') || system('cls')
  end
end
