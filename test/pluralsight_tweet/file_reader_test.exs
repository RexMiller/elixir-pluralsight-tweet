defmodule FileReaderTest do
  use ExUnit.Case
  import PluralsightTweet.FileReader
  import Mock

  doctest PluralsightTweet.FileReader

  test "Should return a string from a file" do
    with_mock File, [read!: fn(_) -> "a string" end] do
      result = get_random_tweet("not_a_file.txt")
      assert result == "a string"
    end
  end

  test "Will not return a string longer than 140 chars" do
    with_mock File, [read!: &has_long_line/1] do
      result = get_random_tweet("not_a_file.txt")
      assert result == "This is a test"
    end
  end

  test "An empty string should return an empty string" do
    with_mock File, [read!: fn(_) -> "" end] do
      result = get_random_tweet("not_a_file.txt")
      assert result == ""
    end
  end

  test "The string should be trimmed" do
    with_mock File, [read!: fn(_) -> " ABC " end] do
      result = get_random_tweet("not_a_file.txt")
      assert result == "ABC"
    end
  end

  def has_long_line(_) do
    "This line is too long because it says four score and seven years ago our fathers brought forth on this continent a new nation conceived in liberty and it is more than 140 characters\r\nThis is a test"
  end
end