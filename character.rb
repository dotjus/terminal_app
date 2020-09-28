class Character
    attr_accessor :location
    def initialize(name, location)
        @health = 5
        @name = name
        @location = location
        
    end

end

class Hero < Character


end

class Monster < Character

end


