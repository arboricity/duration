defmodule Duration.MixProject do
  use Mix.Project

  def project do
    [
      app: :duration,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:nimble_parsec, "~> 0.5.0", only: :dev},
      # {:credo, "~> 1.1", only: [:dev, :test], runtime: false},
      # {:dialyxir, "~> 1.0.0-rc.6", only: [:dev, :test], runtime: false},
      # {:timex, "~> 3.6", only: [:dev, :test], runtime: false}
    ]
  end
end
