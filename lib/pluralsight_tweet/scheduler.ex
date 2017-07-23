# Why do we need a tweet server instead of the scheduler calling PluralsightTweet.Tweet.send/1 directly? 
# It seems like quantum is already part of the supervisor tree and that would be sufficent to ensure the 
# the ability to send tweets after a process crashed and was restarted.

defmodule PluralsightTweet.Scheduler do
  def schedule_file(schedule, filepath) do
    Quantum.add_job(schedule, get_tweet_fn(filepath))
  end

  defp get_tweet_fn(filepath) do
    fn -> 
      PluralsightTweet.FileReader.get_random_tweet(filepath) 
      |> PluralsightTweet.TweetServer.tweet()
    end
  end
end