defmodule PluralsightTweet.Mixfile do
  use Mix.Project

  def project do
    [app: :pluralsight_tweet,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :quantum, :extwitter],
     mod: {PluralsightTweet, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:credo, "~> 0.5.3"},
      {:quantum, "~> 1.8"},
      {:oauth, github: "tim/erlang-oauth"},
      {:extwitter, "~> 0.7.2"},
      {:mock, "~> 0.2.0"},
      {:mix_test_watch, "~> 0.2.6"}
    ]
  end
end
