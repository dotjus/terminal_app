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
        $room_names = []

        $examine_numbers = []
        $examine_names = []

        ###### Print Title and Description
        File.foreach("data/descriptions/" + @name + ".txt") { |line| puts line } 
        # @examine_options

        # ###### Examine Options
        # puts "Examine Options: "
        # file = File.read("data/examine_options/" + @name + ".json")
        # examine_array = JSON.parse(file)
        # examine_array.each_with_index do |hash, index|  # could print just the keys(door names) then have the values to change current room 
        #     print index.to_s +  ". " + hash["name"] + "   " 
        #     $examine_numbers << index
        #     $examine_names << hash["description"]
        # end
        
        ###### Movement Options
        print "\n"
        puts "Movement Options: "
        file = File.read("data/move_options/" + @name + ".json")
        move_array = JSON.parse(file)
        move_array.each_with_index do |hash, index|  # could print just the keys(door names) then have the values to change current room 
            # index = index + 5
            print index.to_s +  ". " + hash["description"] + "   " 
            $room_numbers << index
            $room_names << hash["destination"]
            # p $room_numbers
            # p $room_names
        end

    end

    def user_action

        user_input = gets.chomp.downcase
        case user_input 
            
            ## Examine
        # when $examine_numbers[0].to_s
        #     puts "You examined option 0"

        # when $examine_numbers[1].to_s
        #     puts "You examined option 1"
            
        # when $examine_numbers[2].to_s
        #     puts "You examined option 2"

            ## Movement
        when $room_numbers[0].to_s
            $room_name = $room_names[0]
            return $room_name

        when $room_numbers[1].to_s
            $room_name = $room_names[1]
            return $room_name
            
        when $room_numbers[2].to_s
            $room_name = $room_names[2]
            return $room_names[2]

        else
            puts "invalid input"

        end    
    end

end


