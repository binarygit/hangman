#!/usr/bin/ruby

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
    display_prompt_for_input
  end

  def display_prompt_for_input
    print " please enter your guess: "
  end

  def display_dash_row
    dash_row.each {|dash| print dash}
    print "\n"
  end

  def display_turns_remaining
    print "\n num of turns left: #{turns_remaining}\n"
  end

  def display_save_instruction
    print "\n Type 'S' to save the game"
  end

  def clear_display
    system('clear') || system('cls')
  end

end
