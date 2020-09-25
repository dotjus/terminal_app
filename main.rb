require_relative "ground_floor.rb"
include GroundFloor

require "io/console"

## Main Program Loop
loop do

    def main_menu
        
        puts " "
        puts "THE CURIOUS CASE OF DUDLEY MANOR"
        puts " "
        puts "To start a new game enter:       new" 
        puts "To save your current game enter: save"
        puts "To load an old game enter:       load" 
        puts "To exit enter:                   exit" 

        menu_selection = gets.chomp.downcase
        if menu_selection == "new"
            new_game
        elsif menu_selection == "save"
            save_game
        elsif menu_selection == "load"
            load_game
        elsif menu_selection == "help"
            help_game
        elsif menu_selection == "exit"
            exit_game
        else 
            puts "invalid input"
            main_menu
        end

    end


    def new_game
        
        system "clear"
        # Set location to foyer
        # Set health to 10
        # Set doors unlocked to door_hash = {first_door: 0 ect}
        # Set enimies defeated enemy_hash = {stuffed_wolf: 0 ect}
        File.foreach("descriptions/introduction.txt") { |line| puts line }

        continue_story 

        File.foreach("descriptions/front_gate.txt") { |line| puts line }

        continue_story 

        GroundFloor.main_hall

    end

    def save_game
        puts "You selected save game."
        GroundFloor.sayhi("Justin")
    end

    def load_game
        puts "You selected load game."
        GroundFloor.saybye("Justin")
    end

    def help_game
        puts "You selected load game."
    end

    def exit_game
        exit
    end
                                                                                           
    def continue_story    
             
        puts " "                                                                                                      
        print "press any key to continue..."                                                                                                    
        STDIN.getch                                                                                                              
        print "            \r" # extra space to overwrite in case next sentence is short    
        system "clear"                                                                                                          
    end 

    #Start the application by calling main_menu method
    main_menu

end