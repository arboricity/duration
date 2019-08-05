defmodule Duration.MixProject do
  use Mix.Project

  def project do
    [
      app: :duration,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Duration",
      source_url: "https://lab.errorist.xyz/elixir/duration",
      homepage_url: "http://elixir.errorist.io/duration",
      docs: [
        main: "Duration", # The main page in the docs
        # logo: "path/to/logo.png",
        extras: [
          "guides/advanced/timex.md",
        ],
        groups_for_extras: [
          # "Introduction": Path.wildcard("guides/introduction/*.md"),
          "Advanced": Path.wildcard("guides/advanced/*.md")
        ]
      ],
      # extras: [
      #   "guides/introduction/foo.md",


    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nimble_parsec, "~> 0.5.0", only: [:dev, :test]},
      # {:credo, "~> 1.1", only: [:dev, :test], runtime: false},
      # {:dialyxir, "~> 1.0.0-rc.6", only: [:dev, :test], runtime: false},
      # {:timex, "~> 3.6", only: [:dev, :test], runtime: false}
      {:ex_doc, "~> 0.21", only: [:dev, :test], runtime: false},
    ]
  end
end
