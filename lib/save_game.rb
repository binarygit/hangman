#!/usr/bin/ruby

module SaveGame
  def save_game
    display_screen('save_game')
    file_name = gets.chomp
    serialize(file_name)
  end

  def serialize(file_name)
    file_name = 'saved_games/' + file_name
    obj = {}
    instance_variables.map do |var|
      obj[var] = instance_variable_get(var)
    end

    File.open(file_name, 'w') do |file|
      Marshal.dump(obj, file)
    end
  end

  def saved_games?
    pwd = Dir.pwd
    !Dir.empty?('saved_games')
  end
end
