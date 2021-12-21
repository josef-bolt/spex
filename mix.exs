defmodule Spex.MixProject do
  use Mix.Project

  def project do
    [
      app: :spex,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      source_url: git_url(),
      homepage_url: git_url(),
      description: "Functional helper library"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end

  defp package do
    [
      links: %{"Github" => git_url()},
      licenses: ["GPL-3.0-or-later"]
    ]
  end

  defp git_url, do: "https://github.com/josef-bolt/spex"
end
