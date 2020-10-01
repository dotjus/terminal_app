class Character
    attr_accessor :location
    attr_accessor :inventory
    def initialize(name, location)
        @health = 5
        @name = name
        @location = location
        @inventory = [{}]       
    end

    def update_location(location)
        @location = location
        puts "The players location has been updated to #{location}." 
    end


end

class Hero < Character
    


end

class Monster < Character

end


