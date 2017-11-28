defmodule CardTest do
  use ExUnit.Case
  doctest Card

  test "suit of a card" do
    assert Card.suit('9C') == "C"
    assert Card.suit('9H') == "H"
    assert Card.suit('9D') == "D"
    assert Card.suit('9S') == "S"
  end

  test "value of a card" do
    assert Card.value('2C') == 2
    assert Card.value('3C') == 3
    assert Card.value('4H') == 4
    assert Card.value('5H') == 5
    assert Card.value('6D') == 6
    assert Card.value('7D') == 7
    assert Card.value('8D') == 8
    assert Card.value('9S') == 9
    assert Card.value('TC') == 10
    assert Card.value('JH') == 11
    assert Card.value('QD') == 12
    assert Card.value('KS') == 13
    assert Card.value('AS') == 14
  end
end
