defmodule PokerChallengeTest do
  use ExUnit.Case
  doctest PokerChallenge

  @high_card_low        ['8C', '5D', '4D', '3S', '2H']
  @high_card            ['8C', '7C', '4D', '3S', '2H']
  @pair_low             ['6C', '5D', '5H', '4D', '2S']
  @pair                 ['6C', '5D', '5H', '4D', '3S']
  @three_of_a_kind_low  ['5C', '5D', '5H', '4D', '3S']
  @three_of_a_kind      ['6C', '6D', '6H', '4D', '2S']
  @three_of_a_kind_high ['6C', '6D', '6H', '4D', '3S']

  test "check the hand winner" do
    assert PokerChallenge.winner(@pair_low, @high_card)                   == "White wins"
    assert PokerChallenge.winner(@high_card, @pair_low)                   == "Black wins"
    assert PokerChallenge.winner(@high_card, @high_card)                  == "Draw!"
    assert PokerChallenge.winner(@high_card, @high_card_low)              == "White wins"
    assert PokerChallenge.winner(@pair_low, @pair)                        == "Black wins"
    assert PokerChallenge.winner(@three_of_a_kind_high, @three_of_a_kind) == "White wins"
    assert PokerChallenge.winner(@three_of_a_kind, @three_of_a_kind_low)  == "White wins"
  end
end
