# Using with Timex


```elixir
{:ok, duration} = Duration.new("P1Y")
{:ok, forward} = Duration.to_timex_options(duration, :forward)
{:ok, backward} = Duration.to_timex_options(duration, :backward)
futur = Timex.shift(~D[2018-12-23], forward)
past = Timex.shift(~D[2018-12-23], backward)
```
