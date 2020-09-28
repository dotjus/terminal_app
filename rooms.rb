class Room

    def initialize(name, description, examine_options, move_options)
        @name = name
        @description = description
        @examine_options = examine_options
        @move_options = move_options

    end

    def move_options
        return choices
    end

end


class Room < MainHall
    
end


class Room < DiningRoom
    
end


class Room < SittingRoom
    
end