defmodule Cards do
  def hello do
    "hi there"
  end
  def create_deck do
    ["Ace", "Two", "Three"]
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, hand) do
    Enum.member?(deck,hand)
  end

end
