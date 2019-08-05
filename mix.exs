defmodule Duration.MixProject do
  use Mix.Project

  def project do
    [
      app: :duration,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Duration",
      source_url: "https://lab.errorist.xyz/elixir/duration",
      homepage_url: "http://elixir.errorist.io/duration",
      docs: docs()
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
      {:ex_doc, "~> 0.21", only: [:dev, :test], runtime: false}
    ]
  end

  defp description() do
    "Duration is a tiny package which allows to manipulate ISO 8601:2004 durations."
  end

  defp package do
    [
      name: "duration",
      licenses: ["BSD-3-Clause"],
      links: %{"Errorist" => "https://lab.errorist.xyz/elixir/duration"}
    ]
  end

  defp docs do
    [
      # main: "Duration", # The main page in the docs
      # logo: "path/to/logo.png",
      extras: [
        "guides/advanced/timex.md",
      ],
      groups_for_extras: [
        "Advanced": Path.wildcard("guides/advanced/*.md")
      ]
    ]
  end
end
