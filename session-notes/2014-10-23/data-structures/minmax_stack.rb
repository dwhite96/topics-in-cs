require_relative 'linked_list'

# Implement a "min-max stack" - a stack that has contant-time
# "maximum" _and_ "minimum" operations.


class MinMaxStack
  def initialize
  end

  # Places +item+ on the top of the stack
  def push(item)
  end

  # Removes the item on the top of the stack and returns it.
  # Raises an error if the stack is empty (called a "stack underflow")
  def pop
  end

  # Return the item on the top of the stack without removing it
  def peek
  end

  # Return true if the stack is empty and false otherwise
  def empty?
  end

  # Return the number of items on the stack
  def size
  end

  # Returns the smallest item on the stack
  def min
  end

  # Returns the largest item on the stack
  # O(1) time
  def max
  end
end
