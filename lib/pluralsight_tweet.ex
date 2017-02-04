defmodule PluralsightTweet do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      worker(PluralsightTweet.TweetServer, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PluralsightTweet.Supervisor]
    process = Supervisor.start_link(children, opts)
    cron_schedule = "* * * * *"
    filepath = Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "sample.txt")
    PluralsightTweet.Scheduler.schedule_file(cron_schedule, filepath)

    process
  end
end
