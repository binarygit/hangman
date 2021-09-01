#!/usr/bin/ruby

class Hangman
  def open
    main_menu
  end

  def main_menu
    clear_screen
    puts "\nHello, and welcome to Hangman" +
         "\n(1) New Game" +
         "\n(2) Load Game\n\n"
    human_choice = gets.chomp
    play(human_choice)
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def play(choice)
    clear_screen
    if choice == '1'
      guess_number = 6
      puts "\nType in 'S' to save game" +
           "\nYou have #{guess_number} guesses remaining\n\n"
    end
  end
end

Hangman.new.open

