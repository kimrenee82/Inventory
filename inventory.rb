@inventory = { "belts" =>{"count" => 0}, "shoes" => {"count" => 0}, "ties" => {"count" => 0}, "sock pairs" => {"count"=>0}}
@inventory_items = @inventory.keys

def current_items()
	puts "Current Items in Stock"
	counter = 0		
	@inventory_items.each do |item|
	puts (counter += 1).to_s + ". " + item + ": " + @inventory[item]["count"].to_s
	end
end

def get_quantity()
	puts "How many #{@inventory_items[@edit_item.to_i - 1]} are in stock currently?"
	@edit_quantity = gets.chomp
		until @edit_quantity.to_i >= 0 # && @edit_item is an integer
			puts "You have entered an invalid entry. Please try again"
			@edit_quantity = gets.chomp
		end
	@inventory[@inventory_items[@edit_item.to_i - 1]]["count"] = @edit_quantity
end

# ------ Program Starts ---------
	
puts `clear`

until @edit_item == 'quit' || @task_to_do == 'quit'

	current_items()	
	puts "Which item would you like to edit? Enter a number from the list. To quit, enter 'quit'."
	@edit_item = gets.chomp.downcase
			
		if @edit_item == 'quit'

			puts "Ok. We're done."

			elsif @edit_item.to_i > @inventory_items.length || @edit_item.to_i <= 0

				until @edit_item.to_i <= @inventory_items.length && @edit_item.to_i > 0
				puts "You have entered an invalid entry. Please try again"
				@edit_item = gets.chomp
				end
			else
		end

		if @edit_item.to_i <= @inventory_items.length && @edit_item.to_i > 0

			puts "You have chosen #{@inventory_items[@edit_item.to_i - 1]}"
			puts "Would you like to update the quantity or name of this item? Type 'q' for quantity or 'n' for item name"
			@task_to_do = gets.chomp.downcase

			until @task_to_do == 'q' || @task_to_do == 'n' || @task_to_do == 'quit'
			puts "You have entered an invalid entry. Please try again"
			@task_to_do = gets.chomp.downcase
			end
		end

		if @task_to_do == 'n' && @edit_item != 'quit'

			puts "You are about to edit #{@inventory_items[@edit_item.to_i - 1]} to something else. What would you like to change it to?"
			new_name = gets.chomp.to_s	
			@inventory[new_name] = @inventory.delete(@inventory_items[@edit_item.to_i - 1])
    		@inventory_items = @inventory.keys
  			puts "The name has been updated."
  			@edit_item = @inventory_items.length
			get_quantity() 

			elsif 
				@task_to_do == 'q' && @edit_item != 'quit'		
				get_quantity() 
			else
		end				
end
