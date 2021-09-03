#!/usr/bin/ruby

module LoadGame
  def load_game
    display_load_game_screen
    file_name = gets.chomp
    unserialize(file_name)
  end

  def unserialize(file_name)
    file_name = 'saved_games/' + file_name
    File.open(file_name) do |file|
      obj = Marshal.load(file)
      obj.keys.each do |key|
        instance_variable_set(key, obj[key])
      end
    end
  end
end
