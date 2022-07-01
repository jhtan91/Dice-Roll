#This program simulates dice rolls
    
import random
    
def dice_roll():
    
    #Define the maximum and minimum limits of the dice rolls
    min_val = 1
    max_val = 6
    
    #Define the variable that stores input from user
    roll_again = "yes"
    
    #Loop if user wants to play again
    while roll_again == "yes" or roll_again == "y":
        print('Dices rolling...')
    
        print('The values are: ')
    
    #Print the randomly generated number of the first dice
        print(random.randint(min_val,max_val))
    
    #Print the second randomly generated dice
        print(random.randint(min_val,max_val))
    
    #Ask the user if they want to continue
        roll_again = input('Roll the dices again? Y/N')

dice_roll()