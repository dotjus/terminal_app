require_relative "character.rb"
require_relative "rooms.rb"
require 'json'
require "tty-prompt"

$prompt = TTY::Prompt.new

player = Hero.new("Justin", "Main Hall")
monster = Monster.new("Wolf", "Sitting Room")

rooms = {
    main_hall: Room.new("001_main_hall"),
    dinning_hall: Room.new("002_dinning_hall"),
    closet: Room.new("003_closet"),
    sitting_room: Room.new("004_sitting_room"),
    kitchen: Room.new("005_kitchen")
}

## New game data variables
$health = 5
$room_name = "main_hall"
$player_inventory = [""]

## Create New Player Profile
$current_player_profile = gets.chomp
FileUtils.mkdir "player_data/" + $current_player_profile
FileUtils.copy_entry("default_data", "player_data/" + $current_player_profile, preserve = false, dereference_root = false, remove_destination = false)

## Main game loop
while $health > 0

    ## Set current room based on last door chosen
    current_room = rooms[$room_name.to_sym]
    ## Update players location
    player.update_location(current_room)

    current_room.display_room
    current_room.user_action
    current_room.collect_item($x)

end

## End game conditions