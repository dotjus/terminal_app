require_relative "character.rb"
require_relative "rooms.rb"
require 'json'
require "tty-prompt"

$prompt = TTY::Prompt.new

player = Hero.new("Justin", "Main Hall")
monster = Monster.new("Wolf", "Sitting Room")

## New game data variables
$health = 5
$current_room = "001_main_hall"
$player_inventory = [""]

## Create New Player Profile
$current_player_profile = gets.chomp
FileUtils.mkdir "player_data/" + $current_player_profile
FileUtils.copy_entry("default_data", "player_data/" + $current_player_profile, preserve = false, dereference_root = false, remove_destination = false)

## Main game loop
while $health > 0

    
    display_room
    $current_room = $room_name

end

## End game conditions