require "tty-prompt"

$prompt = TTY::Prompt.new


def continue_story    
         
    puts " "                                                                                                      
    print "press any key to continue..."                                                                                                    
    STDIN.getch                                                                                                              
    print "            \r" # extra space to overwrite in case next sentence is short    
    system "clear"        

end 

class Room
    # attr_accessor :display_room

    def initialize(name)
        @name = name

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

        ###### Print Title and Description
        File.foreach("data/descriptions/" + @name + ".txt") { |line| puts line } 
        # @examine_options

        # ###### Examine Options
        file = File.read("data/examine_options/" + @name + ".json")
        examine_array = JSON.parse(file)
        examine_array.each_with_index do |hash, index|  # could print just the keys(door names) then have the values to change current room 
            $examine_numbers << index
            $examine_names << hash["name"]
            $examine_descriptions << hash["examine"]
        end
        
        ###### Movement Options
        file = File.read("data/move_options/" + @name + ".json")
        move_array = JSON.parse(file)
        move_array.each_with_index do |hash, index|  # could print just the keys(door names) then have the values to change current room 
            $room_numbers << index
            $door_names[hash["description"].to_sym] = index
            $room_names << hash["destination"]
        end

    end

    def user_action
        
        room_options = {examine: 1, move: 2}
        menu = $prompt.select("What would you like to do?", room_options)
        
        if menu == 1
            
            $testy = $prompt.select("Examine Options;", $examine_names)
            
            case $testy

            when $examine_names[0]          ## will need to add -1 or make 0 return to previous menu
                
                puts $examine_descriptions[0]
                continue_story 

            when $examine_names[1]
                puts $examine_descriptions[1]
                continue_story 
                
            when $examine_names[2]
                puts $examine_descriptions[2]
                continue_story 

            else
                puts "nothing to see here"
                continue_story 

            end
                
        elsif menu == 2
            $menu = $prompt.select("Move Options;", $door_names)

            case $menu 

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


end


