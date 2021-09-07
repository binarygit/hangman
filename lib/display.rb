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
    display_verdict_screen
  end

  def display_win_screen
    display_verdict_screen
  end

  def display_verdict_screen
    clear_display
    print verdict
    display_dash_row
    display_guessed_letters
    display_mystery_word if verdict == "\n Sorry, you lose\n\n"
    print "\n\n"
  end

  def verdict
    # find which method lose_screen or win_screen called the
    # display verdict method
    if caller_locations(1, 2)[1].label == 'display_lose_screen'
      return "\n Sorry, you lose\n\n"
    else
      return "\n Hurray, you have won\n\n"
    end
  end

  def display_mystery_word
    print "\n The mystery word was:  "
    print mystery_word.join
  end

  def clear_display
    system('clear') || system('cls')
  end
end
