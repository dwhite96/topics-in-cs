# Given a deck of cards and two "half decks", determine whether the
#   deck of cards could have been produced by a "rifle" of the two halves.
#   Assume the deck contains 52 unique cards, identified by the integers 1..52.

# O(n) time, O(1) space.

  # Compare the full deck with the two halves.
  # Since the order of each half is known, then iterate through the deck
  #   and expect to find each half in order just mixed with the other half.

class CardRiffle
  attr_reader :deck

  def initialize
    @deck = (1..52).to_a.shuffle
  end

  def riffled?(deck, first_half_deck, second_half_deck)
    first_half_card, second_half_card, count = 0, 0, 0

    @deck.each do |card|
      if card.next?(@deck[first_half_deck], first_half_card)
        first_half_card += 1
      elsif card.next?(@deck[second_half_deck], second_half_card)
        second_half_card += 1
      else
        break
      end
      count += 1
    end

    count == 52 ? true : false
  end

  def next?(halve, current_card)
    self == halve[current_card]
  end
end

if __FILE__ == $PROGRAM_NAME
  def card_riffle_test(halve_a, halve_b)
    deck = CardRiffle.new

    if deck.riffled?(@deck, halve_a, halve_b)
      p 'The deck was produced by a riffle of the two halves!'
    else
      p 'The deck was not produced by a riffle of the two halves!'
    end
  end

  # deck = (1..52).to_a.shuffle
  halve_a = (0..25)
  halve_b = (26..51)
  card_riffle_test(halve_a, halve_b)

  # deck = (1..52).to_a.shuffle
  halve_a = (0..25)
  halve_b = (26..50)
  card_riffle_test(halve_a, halve_b)

  # deck = (1..52).to_a.shuffle
  halve_a = *(1..26)
  halve_b = *(27..52)
  card_riffle_test(halve_a, halve_b)
end
