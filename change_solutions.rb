# Write a function that takes in an amount of money and denominations
#   and returns the number of ways to arrive at the amount with those denominations.

# Input amount and denominations
# If the number of denomination types == 1, then return 1 way to arrive at amount
# Asign denominations to value i.e. dime = 10
# Need to count the lowest denomination up to the second lowest denomination
#  then add the second lowest denomination until amount is reached
# Count this as 1 way
# Continue to do this adding more of the lowest denomination and less of the second
#  lowest denomination

# def denominations(amount, denominations = [])
#   denom_type_count = denominations.length
#   if denom_type_count == 1
#     1
#   elsif

#   end
# end


# def denominations(amount, denoms)  
#   solutions = []  
#   temp_denoms = denoms 
#   temp_solution = {} 
#   temp_denoms.each do |k,v| 
#     # until amount % v == 0  
#     temp_solution[k] = amount / v  
#     # amount = amount % v 
#     # end 
#   end 
#   temp_solution 
# end

# Sort the denominations from highest to lowest
# Divide amount by highest (first) denomination
# Find the remainder using modulo between the amount and first denom.
# Recursively call the method again using the remainder as the amount
# Repeat steps until amount being checked is reached
# Increment "number of ways" count
# Add the "number of ways" after recursively calling the method on each denom.
# Output the "number of ways"

def change_solutions(amount, *denominations)
  num_of_solutions = 0
  change = change_calculator(amount, denominations)

  if change < denominations.last
    num_of_solutions += 1
  else
    change_solutions(change, denominations)
  end
  num_of_solutions
end

def change_calculator(amount, denominations)
  denominations.sort.reverse
  denominations.shift if amount < denominations.first
  denom_count = amount / denominations.first
  if denom_count = 1
    remainder = remainder(amount, denominations.first)
  else denom_count >= 2
    denom_total = denominations.first * denom_count
    new_amount = remainder(amount, denom_total)
    change_calculator(new_amount, denominations)
  end
end

def remainder(amount, denomination)
  amount % denomination
end

if __FILE__ == $0
  denominations(15, 10, 5, 1) == 5
  denominations(35, 10, 5, 1) == 37
end
