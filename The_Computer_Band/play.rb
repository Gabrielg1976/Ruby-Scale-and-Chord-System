#!/usr/bin/ruby
#Include Classes
require 'Math'
require 'Item'
require 'Weapon'
require 'Inventory'	#Requires Item
require 'Enemy'		#Requires Math
require 'Player'		#Requires Math, Inventory
require 'BuildItemDB'	#Requires Item

def get_started
	puts "Welcome to the Labyrinth Hunter!  Sir, what name shall I call you by?"
	name = gets.chomp
	puts "So " + name + ", how do you fight?"
	playerClass = gets.chomp.downcase
	classification = nil;
	#Rogue
	classification = "rogue" if playerClass == "rogue"
	classification = "rogue" if playerClass == "sneaky"
	classification = "rogue" if playerClass == "quietly"
	#Aggressive
	classification = "attack" if playerClass == "aggressively"
	classification = "attack" if playerClass == "violently"
	#Defensive
	classification = "defence" if playerClass == "defensively"
	classification = "defence" if playerClass == "on gaurd"
	if classification == nil
		puts "Sorry, but I've never heard of fighting " + playerClass + "."
		puts "Perhaps its something like one of these ways of fighting: sneaky, aggressively, defensively.  Which one is it? (sneaky/aggressively/defensively)"
		playerClass = gets.chomp.downcase
		classification = "rogue" if playerClass == "sneaky"
		classification = "attack" if playerClass == "aggressively"
		classification = "defence" if playerClass == "defensively"
		if classification == nil
			puts "Sorry, I didn't quite catch that, I'm going to assume you fight aggressively."
			classification = "attack"
		end
	end
	puts "You look like you really want to get started."
	puts "Press enter to continue into the Labyrinth of Zedinia."
	gets
	
	#name,gold,health,energy,inventorySize
	gold = 10
	health = 80
	energy= 8
	inventorySize = 6
	
	#Rogues specialities
	gold = 500 if classification == "rogue"
	energy = 10 if classification == "rogue"
	health = 100 if classification == "rogue"
	inventorySize = 4 if classification == "rogue"
	
	#Defensive Specialties
	health = 100 if classification == "defence"
	#Aggressive Specialties
	
	energy = 10 if classification == "attack"
	
	#create player
	player = Player.new(name, gold, health, energy, inventorySize)
end
player = get_started
while true
	puts "Lets explore!  What would you like to do (fight/shop/sell-junk)"
	inp = gets.chomp.downcase
	if(inp == "fight") 
	  
		#Run the fight sequence
		# Enemy.new(Name,Hp,energy)
		
		rnd = rand(4)
		enemy = Enemy.new("Bat",40,7) if rnd == 0
		enemy = Enemy.new("Clown of Doom",100,10) if rnd == 1
		enemy = Enemy.new("Dragon",200,20) if rnd == 2
		enemy = Enemy.new("Snake-man",150,45) if rnd == 3
		
		if  player.fight(enemy)
			rnd = rand(2)
			player.add_energy(rnd)
			puts "You max energy has increased by " + rnd.to_s + "!" if rnd != 0
			
			rnd = rand(6)
			player.add_health(rnd)
			puts "You max health has increased by " + rnd.to_s + "!" if rnd != 0
			
			rnd = rand(2)
			if rnd == 1
				puts "W00T, You got L00T!"
				rnd = rand(6)+1
				player.inventory.add_item_id(rnd)
				player
			end
		end
	end
	if(inp == "sell-junk")
		#GoTo Selling convo
		puts "Gramps: Hey, who do you think you are to come stomping into my place like that?"
		puts "Jo: Dad!  Settle down, its a customer."
		puts "Gramps: Well then, whats he got?"
		puts "Jo: Hold up, I'm looking..."
		totalValue = 0
		player.inventory.items.length.times { |i|
			puts "Item " + (i+1).to_s + ": " + player.inventory.get_item_by_slot(i).to_s + "(Worth: " + player.inventory.get_item_by_slot(i).value.to_s + "g)"
			totalValue += player.inventory.get_item_by_slot(i).value
		}
		puts "Total Value: " + totalValue.to_s + "g"
		player.gold += totalValue
		puts "You now have " + player.gold.to_s + "g!"
		player.inventory.empty
	end
	if(inp == "shop")
		puts "Welcome to the shop!  What would you like to buy?"
		puts " 1 - Dagger (100g)"
		puts " 2 - Sword (250g)"
		puts " 3 - Assault Rifle (1,000g)"
		puts " 4 - Rocket Launcher (10,000g)"
		puts "Enter the # you would like:"
		wanted = gets.chomp
		if wanted == "1"
			puts "Buying Dagger..."
			if player.gold < 100
				puts "   Oops, you don't have enough gold!"
			else
				player.gold -= 100
				player.weapon = 1	
				puts "   You just bought a dagger!"
			end
		elsif wanted == "2"
			puts "Buying Sword..."
			if player.gold < 250
				puts "   Oops, you don't have enough gold!"
			else
				player.gold -= 250
				player.weapon = 2
				puts "   You just bought a sword!"
			end
		elsif wanted == "3"
			puts "Buying Assault Rifle..."
			if player.gold < 1000
				puts "   Oops, you don't have enough gold!"
			else
				player.gold -= 1000
				player.weapon = 3
				puts "   You just bought an Assault Rifle!"
			end
		elsif wanted == "4"
			puts "Buying Rocket Launcher..."
			if player.gold < 10000
				puts "   Oops, you don't have enough gold!"
			else
				player.gold -= 10000
				player.weapon = 4
				puts "   You just bought a Rocket Launchers!"
			end

		end
	end
end