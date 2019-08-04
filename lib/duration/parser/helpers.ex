if Code.ensure_loaded?(NimbleParsec) do
  defmodule Duration.Parser.Helpers do
    import NimbleParsec

    def year do
      integer(4)
      |> unwrap_and_tag(:years)
      |> label("4 digits")
    end

    def year(combinator), do: concat(combinator, year)

    def month do
      integer(2)
      |> post_traverse({:validate_moduli, [12]})
      |> unwrap_and_tag(:months)
      |> label("2 digits")
    end

    def month(combinator), do: concat(combinator, month)

    def day do
      integer(2)
      |> post_traverse({:validate_moduli, [31]})
      |> unwrap_and_tag(:days)
      |> label("2 digits")
    end

    def day(combinator), do: concat(combinator, day)

    def hour do
      integer(2)
      |> post_traverse({:validate_moduli, [24]})
      |> unwrap_and_tag(:hours)
      |> label("2 digits")
    end

    def hour(combinator), do: concat(combinator, hour)

    def minute do
      integer(2)
      |> post_traverse({:validate_moduli, [60]})
      |> unwrap_and_tag(:minutes)
      |> label("2 digits")
    end

    def minute(combinator), do: concat(combinator, minute)

    def second do
      integer(2)
      |> post_traverse({:validate_moduli, [60]})
      |> unwrap_and_tag(:seconds)
      |> label("2 digits")
    end

    def second(combinator), do: concat(combinator, second)

    def dash do
      string("-")
      |> label("dash")
    end

    def dash(combinator), do: concat(combinator, dash)

    def colon do
      string(":")
      |> label("colon")
    end

    def colon(combinator), do: concat(combinator, colon)

    def part(identifier, name) do
      integer(min: 1)
      |> lookahead(string(identifier))
      |> ignore(string(identifier))
      |> unwrap_and_tag(name)
      |> label("2 digits")
    end

    def part(combinator, identifier, name), do: concat(combinator, part(identifier, name))

    def marker_p do
      ignore(string("P"))
    end

    def marker_p(combinator), do: concat(combinator, marker_p)

    def marker_t do
      ignore(string("T"))
    end

    def marker_t(combinator), do: concat(combinator, marker_t)
  end
end
