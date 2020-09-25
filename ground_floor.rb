module GroundFloor

        def sayhi(name)
            puts "hello #{name}"
        end

        def saybye(name)
            puts "bye #{name}"
        end

        def main_hall
            # description = File.open("1_foyer.txt") 
            puts "Main Hall"
            File.foreach("descriptions/ground_floor/1_main_hall.txt") { |line| puts line }  # Opens the file, prints out each line then closes the file.
            
            continue_story 
            
        end


end