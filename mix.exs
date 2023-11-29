defmodule GoApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :go_api,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # Docs
    name: "GoApi",
    source_url: "https://github.com/febrd/go_apiex",
    homepage_url: "https://hex.pm/packages/go_api",
    description: "Elixir package for accessing IDX through goapi.io, enabling search for regions and places in Indonesia.",
    package: [
        licenses: ["MIT"],
        links: %{
          "GitHub" => "https://github.com/febrd/go_apiex",
          "Hex" => "https://hex.pm/packages/go_api"
        }
      ],
    docs: [
      main: "GoApi", # The main page in the docs
      #logo: "https://febrian.id/assets/img/work/goapi.png",
      extras: ["README.md"]
    ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {GoApi.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 2.1"},
      {:poison, "~> 5.0.0"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
