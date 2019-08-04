defmodule Duration.Parser do
  import NimbleParsec
  import Duration.Parser.Helpers

  defparsec(:foo, year(), debug: true)

  # defparsec(:date_1, year |> month |> day, debug: true)
  # defparsec(:date_2, year |> ignore(dash) |> month |> ignore(dash) |> day, debug: true)

  # defparsec(
  #   :date_3,
  #   optional(part("Y", :years)) |> optional(part("M", :months)) |> optional(part("D", :days))
  # )

  # defparsec(:time_1, hour |> minute |> second, debug: true)
  # defparsec(:time_2, hour |> ignore(colon) |> minute |> ignore(colon) |> second, debug: true)

  # defparsec(
  #   :time_3,
  #   optional(part("H", :hours)) |> optional(part("M", :minutes)) |> optional(part("S", :seconds))
  # )

  # defparsec(
  #   :datetime_1,
  #   marker_p |> parsec(:date_1) |> optional(marker_t |> parsec(:time_1)) |> eos()
  # )

  # defparsec(
  #   :datetime_2,
  #   marker_p |> parsec(:date_2) |> optional(marker_t |> parsec(:time_2)) |> eos()
  # )

  # defparsec(
  #   :datetime_3,
  #   marker_p |> parsec(:date_3) |> optional(marker_t |> parsec(:time_3)) |> eos()
  # )

  # defparsec(:parse, choice([parsec(:datetime_1), parsec(:datetime_2), parsec(:datetime_3)]),
  #   debug: true
  # )
end
