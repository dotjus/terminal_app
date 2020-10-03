require "tty-prompt"
require 'fileutils'

$prompt = TTY::Prompt.new

def continue_story    
         
    puts " "                                                                                                      
    print "press any key to continue..."                                                                                                    
    STDIN.getch                                                                                                              
    print "            \r" # extra space to overwrite in case next sentence is short    
    system "clear" 
    display_room     

end 


def collect_item(examine_num)

    if $examine_collectable[examine_num] == true
        menu = $prompt.select("Do you want to take it?", %w(yes no))
        if menu == "yes"
            # $player_inventory << $examine_names[x]

            ## Read file in
            file = File.read("player_data/" + $current_player_profile + "/examine_options/" + $current_room + ".json")
            parsed = JSON.parse(file)
            ## Add picked to players inventory
            $player_inventory << parsed[examine_num]["name"]
            ## Delete picked 
            parsed.delete_at(examine_num)
            ## Write elements - picked back into file
            File.open("player_data/" + $current_player_profile + "/examine_options/" + $current_room + ".json","w") do |f|
                f.write(parsed.to_json)
                end

            p $examine_names[examine_num]
            puts "Your current inventory is #{$player_inventory}."
            
        else
        end
    else
    end

end

def display_room
    ## Clear screen
    system "clear" 

    ## Clear room data
    $room_numbers = []
    $door_names = {}
    $room_names = []

    $examine_numbers = []
    $examine_names = []
    $examine_descriptions = []
    $examine_collectable = []

    ###### Print Title and Description
    File.foreach("player_data/" + $current_player_profile + "/descriptions/" + $current_room + ".txt") { |line| puts line } 
    # @examine_options

    
    
    ###### Examine Options
    file = File.read("player_data/" + $current_player_profile + "/examine_options/" + $current_room + ".json")
    examine_array = JSON.parse(file)
    
    examine_array.each_with_index do |hash, index|  # could print just the keys(door names) then have the values to change current room 
        $examine_numbers << index
        $examine_names << hash["name"]
        $examine_descriptions << hash["examine"]
        $examine_collectable << hash["collectable"]
    end
    
    ###### Movement Options
    file = File.read("player_data/" + $current_player_profile + "/move_options/" + $current_room + ".json")
    move_array = JSON.parse(file)
    move_array.each_with_index do |hash, index|  # could print just the keys(door names) then have the values to change current room 
        $room_numbers << index
        $door_names[hash["description"].to_sym] = index
        $room_names << hash["destination"]
    end
    
    ###### User Options
    room_options = {examine: 1, move: 2}
    menu = $prompt.select("What would you like to do?", room_options)
    
    if menu == 1
        
        examaine_menu = $prompt.select("Examine Options;", $examine_names)
        
        case examaine_menu

        when $examine_names[0]          ## will need to add -1 or make 0 return to previous menu
            puts $examine_descriptions[0]
            collect_item(0)
            continue_story 

        when $examine_names[1]
            puts $examine_descriptions[1]
            collect_item(1)
            continue_story 
            
        when $examine_names[2]
            puts $examine_descriptions[2]
            collect_item(2)
            continue_story 

        when $examine_names[3]
            puts $examine_descriptions[3]
            collect_item(3)
            continue_story 
            
        else
            puts "nothing to see here"
            continue_story 

        end
            
    elsif menu == 2
        move_menu = $prompt.select("Move Options;", $door_names)  

        case move_menu 

        when $room_numbers[0]          ## will need to add -1 or make 0 return to previous menu
            $room_name = $room_names[0]
            return $room_name

        when $room_numbers[1]
            $room_name = $room_names[1]
            return $room_name
            
        when $room_numbers[2]
            $room_name = $room_names[2]
            return $room_names[2]

        else
            puts "invalid input"

        end

    # elsif menu == 3
    #     puts "Fight!"
    
    end

end




