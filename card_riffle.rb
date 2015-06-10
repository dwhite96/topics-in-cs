# Given a deck of cards and two "half decks", determine whether the
#   deck of cards could have been produced by a "rifle" of the two halves.
#   Assume the deck contains 52 unique cards, identified by the integers 1..52.

# O(n) time, O(1) space.

  # Compare the full deck with the two halves.
  # Since the order of each half is known, then iterate through the deck
  #   and expect to find each half in order just mixed with the other half.

def riffled?(deck, first_half_deck, second_half_deck)
  first_half_card, second_half_card, count = 0, 0, 0

  deck.each do |card|
    if next?(card, first_half_deck, first_half_card)
      first_half_card += 1
    elsif next?(card, second_half_deck, second_half_card)
      second_half_card += 1
    else
      break
    end
    count += 1
  end

  count == 52 ? true : false
end

def next?(card, halve, current_card)
  card == halve[current_card]
end

if __FILE__ == $PROGRAM_NAME
  def card_riffle_test(deck, first_half_deck, second_half_deck)
    if riffled?(deck, first_half_deck, second_half_deck)
      p 'The deck was produced by a riffle of the two halves!'
    else
      p 'The deck was not produced by a riffle of the two halves!'
    end
  end

  deck = (1..52).to_a.shuffle
  first_half_deck = deck[0..25]
  second_half_deck = deck[26..51]
  card_riffle_test(deck, first_half_deck, second_half_deck)

  deck = (1..52).to_a.shuffle
  first_half_deck = deck[0..25]
  second_half_deck = deck[26..50]
  card_riffle_test(deck, first_half_deck, second_half_deck)

  deck = (1..52).to_a.shuffle
  first_half_deck = *(1..26)
  second_half_deck = *(27..52)
  card_riffle_test(deck, first_half_deck, second_half_deck)
end
