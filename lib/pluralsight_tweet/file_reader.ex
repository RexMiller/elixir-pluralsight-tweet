defmodule PluralsightTweet.FileReader do
@moduledoc """
Reads a file for suitable lines to tweet
"""

  @doc """
  Given a valid file path will get all the lines, trim them, filter any lines longer than 140 characters, and then return a randomly selected line.

  iex> PluralsightTweet.FileReader.get_random_tweet("priv/test/doc.txt")
  "line 1"
  """
  def get_random_tweet(path) do
    File.read!(path) 
    |> pick_line
  end

  defp pick_line(contents) do
    contents
    |> String.split("\r\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(&String.length(&1) <= 140)
    |> Enum.random()
  end
end