require_relative "character.rb"
require_relative "rooms.rb"
require 'json'

player = Hero.new("Justin", "Main Hall")
monster = Monster.new("Wolf", "Sitting Room")

$health = 5
## Move Option Hash

rooms = {
    main_hall: Room.new("Main Hall", "1_main_hall", "w", "1_main_hall"),
    dinning_hall: Room.new("Dinning Hall", "2_dinning_hall", "t", "1")
}

current_room = rooms[:main_hall]
current_room.display_room
current_room.user_action

while $health > 0
# system("clear")

current_room = rooms[$room_name.to_sym]
current_room.display_room
current_room.user_action

# next_room_string = dinning_hall.display_room
# p next_room_string
# make method to get room from a room string
# return an instance of Room class from next_room_string




# $room_name.display_room
# $room_name.user_action
# puts "The current room is #{current_room} "

end