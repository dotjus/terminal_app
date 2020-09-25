require_relative "ground_floor.rb"


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
        puts "You have just finished college and are taking you first assignment as a detective."
        puts "Your first assignment is to investigate the dissapearance of the Dudley family."
        puts "The family lived in a large manor several km's in the Berkley forest."
        puts "Senior detective, Mel Dyer, has instructed you to vist their residence to search for clues."
    end

    def save_game
        puts "You selected save game."
    end

    def load_game
        puts "You selected load game."
    end

    def help_game
        puts "You selected load game."
    end

    def exit_game
        exit
    end


    #Start the application by calling main_menu method
    main_menu

end