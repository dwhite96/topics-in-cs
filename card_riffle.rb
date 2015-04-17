# Given a deck of cards and two "half decks", determine whether the
#   deck of cards could have been produced by a "rifle" of the two halves.
#   Assume the deck contains 52 unique cards, identified by the integers 1..52.

# O(n) time, O(1) space.

  # Compare the full deck with the two halves.
  # Since the order of each half is known, then iterate through the deck
  #   and expect to find each half in order just mixed with the other half.

def card_riffle?(deck, halve_a, halve_b)
  index_a, index_b, count = 0, 0, 0

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

  count == 52 ? true : false
end

if __FILE__ == $PROGRAM_NAME
  deck = (1..52).to_a.shuffle
  halve_a = deck[0..25]
  halve_b = deck[26..51]

  if card_riffle?(deck, halve_a, halve_b) == true
    p 'The deck was produced by a riffle of the two halves!'
  else
    p 'The deck was not produced by a riffle of the two halves!'
  end

  deck = (1..52).to_a.shuffle
  halve_a = deck[0..25]
  halve_b = deck[26..50]

  if card_riffle?(deck, halve_a, halve_b) == true
    p 'The deck was produced by a riffle of the two halves!'
  else
    p 'The deck was not produced by a riffle of the two halves!'
  end

  deck = (1..52).to_a.shuffle
  halve_a = *(1..26)
  halve_b = *(27..52)

  if card_riffle?(deck, halve_a, halve_b) == true
    p 'The deck was produced by a riffle of the two halves!'
  else
    p 'The deck was not produced by a riffle of the two halves!'
  end
end
