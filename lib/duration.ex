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
  Documentation for Duration.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Duration.parse_duration("PT3S")
      {:ok, %Duration{seconds: 3}}

  """
  def parse_duration(value) when is_binary(value) do
    case Parser.parse(value) do
      {:ok, params, _, _, _, _} ->
        {:ok, struct(__MODULE__, params)}

      z ->
        {:error, z}
    end
  end

  def parse_duration(_) do
    {:error}
  end
end

defimpl String.Chars, for: Duration do
  def to_string(value) do
    output = "P"
    output = output <> if value.years > 0, do: "#{value.years}Y", else: ""
    output = output <> if value.months > 0, do: "#{value.months}M", else: ""
    output = output <> if value.days > 0, do: "#{value.days}D", else: ""
    output = output <> if (value.hours || value.minutes || value.seconds) > 0, do: "T", else: ""
    output = output <> if value.hours > 0, do: "#{value.hours}H", else: ""
    output = output <> if value.minutes > 0, do: "#{value.minutes}M", else: ""
    output = output <> if value.seconds > 0, do: "#{value.seconds}S", else: ""
    output = if output in ["P", "PT"], do: "PT0S", else: output
    output
  end
end

if Code.ensure_loaded?(Phoenix.HTML.Safe) do
  defimpl Phoenix.HTML.Safe, for: Duration do
    def to_iodata(value), do: to_string(value)
  end
end
