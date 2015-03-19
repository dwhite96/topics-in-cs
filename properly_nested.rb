require_relative "stack"

# Detect opening brace, parens, or bracket (regex?)
# Check for first character. It should be an opening character
# Check for next character,
#   if same as previous character and closing, store as completed
# Check for next opening character

class NestedStack < Stack
  def nested?(string)
    string.each_char do |char|

    end

  end
end
