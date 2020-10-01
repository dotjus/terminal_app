require_relative "character.rb"
require_relative "rooms.rb"
require 'json'
require "tty-prompt"

prompt = TTY::Prompt.new

player = Hero.new("Justin", "Main Hall")
monster = Monster.new("Wolf", "Sitting Room")

$health = 5
## Move Option Hash

rooms = {
    main_hall: Room.new("001_main_hall"),
    dinning_hall: Room.new("002_dinning_hall"),
    closet: Room.new("003_closet"),
    sitting_room: Room.new("004_sitting_room"),
    kitchen: Room.new("005_kitchen")
}

current_room = rooms[:main_hall]
current_room.display_room
current_room.user_action

## Main game loop
while $health > 0
# system("clear")

## Set current room based on last door chosen
current_room = rooms[$room_name.to_sym]
## Update players location
player.update_location(current_room)

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