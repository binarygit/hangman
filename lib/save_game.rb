#!/usr/bin/ruby

module SaveGame

  def save_game
    @turns_remaining = 0
    display_save_game_screen
  end


  def saved_games?
    pwd = Dir.pwd
    !Dir.empty?('saved_games')
  end
end

