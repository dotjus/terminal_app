
require_relative "character.rb"

player = Hero.new("Justin", "Main Hall")
monster = Monster.new("Wolf", "Sitting Room")

fight_mode = false

############################## Main Hall ####################################
def main_hall(player, monster)
    ## Clear screen
    system "clear" 

    ## Print title & description
    File.foreach("descriptions/ground_floor/1_main_hall.txt") { |line| puts line } # Print title and description

    ## Checks for monster
    if player.location == monster.location
        puts "YES MONSTER"
        fight_mode = true
    else
        puts "NO MONSTER"
    end

    ## Prints user input options for this room
    File.foreach("descriptions/ground_floor/1_main_hall_options.txt") { |line| puts line } # Print title and description

    ## Calls user input
    main_hall_options(player, monster)
end

def main_hall_options(player, monster)
    ## Gets users input and calls related method
    user_input = gets.chomp.downcase
    case user_input 
    
    ## Numbers call different room methods
    when "1" 
        dinning_hall(player, monster)
    when "2" 
        puts "Its just an old dust closet, nothing of interest here."
        main_hall_options(player, monster) 
    when "3"
        sitting_room(player, monster)

    ## letters print extra descriptive text then repeat method
    when "f"
        puts "the fire is warm and inviting."  
        main_hall_options(player, monster)        
         
    when "w"
        puts "nice walls."
        main_hall_options(player, monster)

    when "wo"
        puts "a staunch looking family"
        main_hall_options(player, monster)
    else
        puts "invalid input"
        main_hall_options(player, monster)
    end
end

############################## Dinning Hall ####################################
def dinning_hall(player, monster)
    ## Clear screen
    system "clear"

    ## Print title & description
    File.foreach("descriptions/ground_floor/2_dinning_hall.txt") { |line| puts line } # Print title and description

    ## Checks for monster
    if player.location == monster.location
        puts "YES MONSTER"
        fight_mode = true
    else
        puts "NO MONSTER"
    end

    ## Prints user input options for this room
    File.foreach("descriptions/ground_floor/2_dinning_hall_options.txt") { |line| puts line } # Print title and description

    ## Calls user input
    dinning_hall_options(player, monster)

end

def dinning_hall_options(player, monster)

    ## Gets users input and calls related method
    user_input = gets.chomp.downcase
    case user_input 
    
    ## Numbers call different room methods
    when "1" 
        main_hall(player, monster)

    ## letters print extra descriptive text then repeat method
    when "t"
        puts "A tapestry depicting nobles hunting wolves from horseback hangs from the wall. This, you see, is privilege at its finest. The Dudley family lives well and lives large."  
        dinning_hall_options(player, monster)        
         
    when "d"
        puts "There is a large kitchen knife on the table. You take it!"
        dinning_hall_options(player, monster)
        
    else
        puts "invalid input"
        dinning_hall_options(player, monster)
    end

end

############################## Sitting Room ####################################
def sitting_room(player, monster)
    ## Clear screen
    system "clear"

    ## Print title & description
    File.foreach("descriptions/ground_floor/3_sitting_room.txt") { |line| puts line } # Print title and description

    ## Checks for monster
    if player.location == monster.location
        puts "YES MONSTER"
        fight_mode = true
    else
        puts "NO MONSTER"
    end

    ## Prints user input options for this room
    File.foreach("descriptions/ground_floor/3_sitting_room_options.txt") { |line| puts line } # Print title and description

    ## Calls user input
    sitting_room_options(player, monster)

end

def sitting_room_options(player, monster)

    ## Gets users input and calls related method
    user_input = gets.chomp.downcase
    case user_input 
    
    ## Numbers call different room methods
    when "1" 
        main_hall(player, monster)

    ## letters print extra descriptive text then repeat method
    when "c"
        puts "They are locked!!"
        sitting_room_options(player, monster)       
        
    else
        puts "invalid input"
        sitting_room_options(player, monster)
    end

end


main_hall(player, monster)