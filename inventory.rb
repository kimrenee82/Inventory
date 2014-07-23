@inventory = {"belts" =>{"id" => 1, "count" => 50}, "shoes" => {"id" => 2, "count" => 75}, "ties" => {"id" => 3, "count" => 89}, "sock pairs" => {"id"=>4, "count"=>7}}
@inventory_items = @inventory.keys
@edit_item = 'go'
@task_to_do = 'go'

def current_items(counter)
puts "Current Items in Stock"
	until counter == @inventory_items.length
		item = @inventory_items[counter]
		print counter + 1
		puts ". " + item + ": " + @inventory[item]["count"].to_s
		counter +=1	
	end
	puts
end

def get_quantity()
	puts "How many #{@inventory_items[@edit_item.to_i - 1]} are in stock currently?"
	@edit_quantity = gets.chomp

		until @edit_quantity.to_i >= 0
			puts "You have entered an invalid entry. Please try again"
			@edit_quantity = gets.chomp
		end

	@inventory[@inventory_items[@edit_item.to_i - 1]]["count"] = @edit_quantity
	current_items(0)	
	puts
end


def change_name(old,new)
    @inventory[new] = @inventory.delete(old)
    @inventory_items = @inventory.keys
  	puts "The name has been updated."
	puts 
end

# -------------------------- Program Starts -----------------------
	
puts `clear`

current_items(0)	

until @edit_item == 'quit' || @task_to_do == 'quit'

	puts "Which item would you like to edit? Enter a number from the list. To quit, enter 'quit'."
	@edit_item = gets.chomp.downcase

		if @edit_item.to_i > @inventory_items.length || @edit_item.to_i <= 0
		
			until @edit_item.to_i <= @inventory_items.length && @edit_item != 'quit' && @edit_item.to_i > 0
				puts "You have entered an invalid entry. Please try again"
				@edit_item = gets.chomp
			end
		end
			
		puts "You have chosen #{@inventory_items[@edit_item.to_i - 1]}"
		puts "Would you like to update the quantity or name of this item? Type 'Q' for quantity or 'N' for item name"
		@task_to_do = gets.chomp.downcase

		until @task_to_do == 'q' || @task_to_do == 'n' || @task_to_do == 'quit'
			puts "You have entered an invalid entry. Please try again"
			@task_to_do = gets.chomp.downcase
		end

		if @task_to_do == 'n'

			puts "You are about to edit #{@inventory_items[@edit_item.to_i - 1]} to something else. What would you like to change it to?"
			new_name = gets.chomp.to_s	
			change_name(@inventory_items[@edit_item.to_i - 1], new_name)		
			@edit_item = @inventory_items.length
			get_quantity() 


			elsif @task_to_do == 'q'		

				get_quantity() 
		
			else

				puts "Thanks. We're done."

		end
				
end

#Hi! It's Jessica, practicing forking. :)
