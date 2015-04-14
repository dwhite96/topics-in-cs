# Given a deck of cards and two "half decks", determine whether the
#   deck of cards could have been produced by a "rifle" of the two halves.
#   Assume the deck contains 52 unique cards, identified by the integers 1..52.

# O(n) time, O(1) space.

  # Input a deck of cards identified by the integers 1..52. Can be any order.
  # Input a deck of cards identified by the integers 1..52 in any order but split in two.
  # Compare the full deck with the two halves.
  # Regardless of order of cards (in two halves), imagine the index positions are
  #   always the same: 1..52
  # Look for alternating cards in the full deck: 1,27,2,28,3,29,4,30...etc.
  # If the cards alternate perfectly, then the full deck is a riffle.
  # It is possible that the cards don't alternate perfectly.
  # Since the order from each half is known, then you can iterate through the deck
  #   and expect to find each half in order just mixed with the other half.
  # At what point though should the program know the deck couldn't have been riffled?
# class CardRiffle
# end

def card_riffle(deck, halve_a, halve_b)
  index_a = 0
  index_b = 0
  count = 0
  deck.each do |card|
    if card == halve_a[index_a]
      index_a += 1
    elsif card == halve_b[index_b]
      index_b += 1
    else
      break
    end
    count += 1
  end

  if count == 52
    puts "The deck was produced by a riffle of the two halves!"
  else
    puts "The deck was not produced by a riffle of the two halves!"
  end
end

if __FILE__ == $PROGRAM_NAME
  deck = (1..52).to_a.shuffle
  halve_a = deck[0..25]
  halve_b = deck[26..51]

  # halve_a = *(1..26)
  # halve_b = *(27..52)

  card_riffle(deck, halve_a, halve_b)
end
