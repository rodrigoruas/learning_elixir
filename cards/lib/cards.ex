defmodule Cards do
  def hello do
    "hi there"
  end
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, hand) do
    Enum.member?(deck,hand)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

end
