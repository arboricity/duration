defmodule Duration.Parser do
  @moduledoc false

  # parsec:Duration.Parser
  import NimbleParsec
  import Duration.Parser.Helpers

  defparsec(:date_1, year() |> month() |> day())
  defparsec(:date_2, year() |> ignore(dash()) |> month() |> ignore(dash()) |> day())

  defparsec(
    :date_3,
    optional(part("Y", :years)) |> optional(part("M", :months)) |> optional(part("D", :days))
  )

  defparsec(:time_1, hour() |> minute() |> second())
  defparsec(:time_2, hour() |> ignore(colon()) |> minute() |> ignore(colon()) |> second())

  defparsec(
    :time_3,
    optional(part("H", :hours)) |> optional(part("M", :minutes)) |> optional(part("S", :seconds))
  )

  defparsec(
    :datetime_1,
    marker_p() |> parsec(:date_1) |> marker_t() |> parsec(:time_1) |> eos()
  )

  defparsec(
    :datetime_2,
    marker_p() |> parsec(:date_2) |> marker_t() |> parsec(:time_2) |> eos()
  )

  defparsec(
    :datetime_3,
    marker_p() |> parsec(:date_3) |> optional(marker_t() |> parsec(:time_3)) |> eos()
  )

  defparsec(:parse, choice([parsec(:datetime_1), parsec(:datetime_2), parsec(:datetime_3)]),
    debug: true
  )

  # parsec:Duration.Parser

  defp validate_moduli(_rest, args, context, _line, _offset, moduli) do
    if Enum.any?(args, fn x -> x > moduli end) do
      [head | _] = args
      {:error, "moduli #{head} / #{moduli}"}
    else
      {args, context}
    end
  end
end
