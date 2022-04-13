defmodule Duration do
  @type t :: %__MODULE__{
          years: non_neg_integer,
          months: non_neg_integer,
          days: non_neg_integer,
          hours: non_neg_integer,
          minutes: non_neg_integer,
          seconds: non_neg_integer
        }
  defstruct years: 0,
            months: 0,
            days: 0,
            hours: 0,
            minutes: 0,
            seconds: 0

  alias Duration.Parser

  @moduledoc """
  Convenient module to play with ISO 8601:2004 durations and `Timex.shift/2`.
  """

  @doc """
  Loads a `Duration.t`.
  """
  @spec new(Duration.t()) :: {:ok, Duration.t()} | {:error, atom}
  @spec new(String.t()) :: {:ok, Duration.t()} | {:error, atom}
  @spec new(list) :: {:ok, Duration.t()} | {:error, atom}
  def new(%Duration{} = val), do: {:ok, val}

  def new(val) when is_binary(val) do
    parse(val)
  end

  def new(opts) when is_list(opts) do
    params = opts |> Keyword.take([:years, :months, :days, :hours, :minutes, :seconds])
    params = params |> Enum.map(fn {k, v} -> {k, abs(v)} end)

    if params == opts do
      {:ok, struct(__MODULE__, params)}
    else
      {:error, :wrong_options}
    end
  end

  @doc """
  Parse a duration string to a `Duration.t`.

  ## Examples

      iex> Duration.parse("PT3S")
      {:ok, %Duration{seconds: 3}}

  """
  @spec parse(String.t()) :: {:ok, Duration.t()} | {:error, atom}
  def parse(value) when is_binary(value) do
    case Parser.parse(value) do
      {:ok, params, _, _, _, _} ->
        {:ok, struct(__MODULE__, params)}

      _ ->
        {:error, :invalid_duration}
    end
  end

  def parse(_) do
    {:error, :parse_error}
  end

  @doc """
  Converts a `Duration.t` into `Timex.shift_options`, wich can be used with `Timex.shift/2`.

  ## Examples

  Go forward

      iex > Duration.to_timex_options(%Duration{years: 1})
      {:ok, [days: 0, hours: 0, minutes: 0, months: 0, seconds: 0, years: 1]}

  Go backward

      iex > Duration.to_timex_options(%Duration{years: 1}; :backward)
      {:ok, [days: 0, hours: 0, minutes: 0, months: 0, seconds: 0, years: -1]}

  """
  def to_timex_options(%Duration{} = duration, direction \\ :forward)
      when direction in [:forward, :backward] do
    options =
      case direction do
        :forward -> Map.from_struct(duration) |> Map.to_list()
        :backward -> Map.from_struct(duration) |> Enum.map(fn {k, v} -> {k, v * -1} end)
      end

    {:ok, options |> Enum.filter(fn {_, v} -> v != 0 end)}
  end
end

defimpl String.Chars, for: Duration do
  def to_string(value) do
    output = "P"
    output = output <> if value.years > 0, do: "#{value.years}Y", else: ""
    output = output <> if value.months > 0, do: "#{value.months}M", else: ""
    output = output <> if value.days > 0, do: "#{value.days}D", else: ""

    output =
      output <> if value.hours > 0 || value.minutes > 0 || value.seconds > 0, do: "T", else: ""

    output = output <> if value.hours > 0, do: "#{value.hours}H", else: ""
    output = output <> if value.minutes > 0, do: "#{value.minutes}M", else: ""
    output = output <> if value.seconds > 0, do: "#{value.seconds}S", else: ""

    if output in ["P", "PT"], do: "PT0S", else: output
  end
end

if Code.ensure_loaded?(Phoenix.HTML.Safe) do
  defimpl Phoenix.HTML.Safe, for: Duration do
    def to_iodata(value), do: to_string(value)
  end
end
