
require_relative "character.rb"

current_room = "1_main_hall"

player = Hero.new("Justin", "Main Hall")
monster = Monster.new("Wolf", "Sitting Room")

fight_mode = false

def room_display(current_room, player, monster)

    File.foreach("descriptions/ground_floor/" + current_room  + ".txt") { |line| puts line } # Print title and description

    if player.location == monster.location
        puts "YES MONSTER"
        fight_mode = true
    else
        puts "NO MONSTER"
    end

    File.foreach("descriptions/ground_floor/" + current_room  + "_options.txt") { |line| puts line } # Print title and description

    user_input = gets.chomp.downcase

    case user_input 
    when "1" 
        puts "kitchen"
    end

end



room_display(current_room, player, monster)

