require_relative "character.rb"

require "io/console"




def save_game

end

def load_game
 
end

def help_game
    puts "You selected load game."
end


                                                                                       
def continue_story    
         
    puts " "                                                                                                      
    print "press any key to continue..."                                                                                                    
    STDIN.getch                                                                                                              
    print "            \r" # extra space to overwrite in case next sentence is short    
    system "clear"                                                                                                          
end 



## Main Program Loop
loop do


    puts " "
    puts "THE CURIOUS CASE OF DUDLEY MANOR"
    puts " "
    puts "To start a new game enter:       new" 
    puts "To save your current game enter: save"
    puts "To load an old game enter:       load" 
    puts "To exit enter:                   exit" 

    menu_selection = gets.chomp.downcase
    case menu_selection 
    when "new"

        player = Hero.new("Justin", "Main Hall")
        monster = Monster.new("Wolf", "Sitting Room")

        system "clear"
        # Set location to foyer
        # Set health to 10
        # Set doors unlocked to door_hash = {first_door: 0 ect}
        # Set enimies defeated enemy_hash = {stuffed_wolf: 0 ect}
        File.foreach("descriptions/introduction.txt") { |line| puts line }
    
        continue_story 
    
        File.foreach("descriptions/front_gate.txt") { |line| puts line }
    
        continue_story 
    
        puts "Main Hall"
        File.foreach("descriptions/ground_floor/1_main_hall.txt") { |line| puts line }  # Opens the file, prints out each line then closes the file.
 
        # Monster Checker
        if player.location == monster.location
            puts "Monster is in the same room"
            # Fighting is on
        else
            puts "Monster is not in same room"
        end

        puts "Move options;"
        puts "(1). left door   -   (2). second left door   -   (3). right door"
        puts "Examine options;"
        puts "(f)ire place   -   (w)alls  -   (wo)oden plaque"
        user_input = gets.chomp.downcase
        case user_input
        when "1"
            puts "Kitchen"
            File.foreach("descriptions/ground_floor/2_kitchen.txt") { |line| puts line }
            if player.location == monster.location
                puts "Monster is in the same room"
                # Fighting is on
            else
                puts "Monster is not in same room"
            end
            
        when "2"
            puts "You moved to the closset"


        when "3"
            puts "You moved to the sitting room"
        when "f"
            puts "The fire glows warmly"
        when "w"
            puts "You marvel at the craftsmanship of the ornate walls, but soon realize that that between the nymphs and satyrs lie serpents and skulls, all woven into the design. Maybe it's metaphorical."
        when "wo"
            puts "A family of stony-faced aristocrats watch you with disinterest; the plaque on the frame reads, the Dudleys, in gold cursive lettering."   
        
        end
        

    when "save"
        save_game
    when "load"
        load_game
    when "help"
        help_game
    when "exit"
        exit
    else 
        puts "invalid input"
        
    end




    #Start the application by calling main_menu method
    

end