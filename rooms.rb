class Room
    # attr_accessor :display_room

    def initialize(name, description, examine_options, move_options)
        @name = name
        @description = description
        @examine_options = examine_options
        @move_options = move_options

    end

    def display_room
        ## Clear screen
        system "clear" 
        $room_numbers = []
        $room_names = []

        ###### Print Title and Description
        File.foreach("descriptions/ground_floor/" + @description + ".txt") { |line| puts line } 
        @examine_options
        
        ###### Movement Options
        print "Movement Options: "
        file = File.read("descriptions/ground_floor/" + @description + "_move.json")
        move_array = JSON.parse(file)
        move_array.each_with_index do |hash, index|  # could print just the keys(door names) then have the values to change current room 
            print index.to_s +  ". " + hash["description"] + "   " 
            $room_numbers << index
            $room_names << hash["destination"]
        end

    end

    def user_action
        user_input = gets.chomp.downcase
        case user_input 
            
        when $room_numbers[0].to_s
            $room_name = $room_names[0]
            return $room_name
            
            
        when $room_numbers[1].to_s
            $room_name = $room_names[1]
            return $room_names[1]

        else
            puts "invalid input"

        end    
    end

end


