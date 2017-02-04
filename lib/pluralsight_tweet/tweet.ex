defmodule PluralsightTweet.Tweet do
  def send(str) do
    ExTwitter.configure(
      :process,
      consumer_key: System.get_env("ELIXIR_TWEET_SANDBOX_CONSUMER_KEY"),
      consumer_secret: System.get_env("ELIXIR_TWEET_SANDBOX_CONSUMER_SECRET"),
      access_token: System.get_env("ELIXIR_TWEET_SANDBOX_ACCESS_TOKEN"),
      access_token_secret: System.get_env("ELIXIR_TWEET_SANDBOX_ACCESS_SECRET")
    )

    # ExTwitter.update(str)
    IO.puts(str)
  end

end