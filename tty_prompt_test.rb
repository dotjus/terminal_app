require "tty-prompt"

prompt = TTY::Prompt.new

room_options = {examine: 0, move: 1,}
# examine_options = {"fire place" 1, "stove top" 2,}
# choices2 = {very_small: 1, very_medium: 2, very_large: 3}

menu = prompt.select("Move Options;", room_options)

if menu = 1
    puts "You selected examine"
    p menu.to_s
else menu = 2
    puts "You selected move"
    p menu.to_s
end