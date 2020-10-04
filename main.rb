require_relative "rooms.rb"
require 'json'
require "tty-prompt"
require "io/console"
require "tty-font"
require "pastel"
require "ruby2d"
require 'optparse'

$prompt = TTY::Prompt.new
heading_font = TTY::Font.new(:straight)
pastel = Pastel.new

@options = {} 

op = OptionParser.new do |opts|
    opts.on("-s", "--skip", "Skips introductory text after creating a new player profile") do
        @options[:skip_intro] = true
    end
    opts.on("-c", "--cheat", "Adds a grenade launcher to inventory.") do
        @options[:cheat] = "grenade launcher"
    end
end

op.parse!

def continue_story(disp_room)    
         
    puts " "                                                                                                      
    print "press any key to continue..."                                                                                                    
    STDIN.getch                                                                                                              
    print "            \r" # extra space to overwrite in case next sentence is short    
    system "clear" 
    if disp_room == true
        display_room   
    else
    end  

end 


## Main Program Loop
loop do

    system "clear" 
    puts heading_font.write("THE CURIOUS CASE OF DUDLEY MANOR")
    puts pastel.red("THE CURIOUS CASE OF DUDLEY MANOR")
    puts " "
    puts "To start a new game enter:       new" 
    puts "To save your current game enter: save"
    puts "To load an old game enter:       load" 
    puts "To exit enter:                   exit" 

    menu_selection = gets.chomp.downcase
    case menu_selection 

    when "new"

    begin

        ## Creates New Player Profile
        puts "Please enter your player name:"
        $current_player_profile = gets.chomp
        FileUtils.mkdir "player_data/" + $current_player_profile
        FileUtils.copy_entry("default_data", "player_data/" + $current_player_profile, preserve = false, dereference_root = false, remove_destination = false)


        ## Set player data
        $health = 5
        $current_room = "001_main_hall"
        $player_inventory = ["torch"]
        $player_inventory << @options[:cheat]

        system "clear"

        if @options[:skip_intro] == nil
            ## Story Introduction
            File.foreach("default_data/introduction.txt") { |line| puts line }
        
            continue_story(false)
        
            File.foreach("default_data/front_gate.txt") { |line| puts line }
        
            continue_story(false)
        else
        end
    
        ## Game loop
        while $health > 0 and $current_room != "006_GAME_COMPLETE"
            
            display_room
            $current_room = $room_name

        end
    
    rescue Errno::EEXIST
        puts "That user name has already been taken. Please choose another."

        continue_story(false) 

    end
        

    when "save"

        puts "export hp, current room and inventory"

    when "load"

        puts "list usernames"
        puts "open directory with that player name"
        puts "Set current_player var"
        puts "Set load data into other variables"

    when "help"

        puts "help file"

        continue_story(false)

    when "exit"

        exit

    else 

        puts "Invalid input, please enter one of the listed options."
        continue_story(false) 

    end

    #Start the application by calling main_menu method

end