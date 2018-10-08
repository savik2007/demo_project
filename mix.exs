defmodule DemoProject.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "1.0.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixir: "1.6.6",
      erlang_otp: "21.0",
      dialyzer: [plt_add_apps: [:ex_unit]]
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    [
      {:distillery, "~> 2.0"},
      {:dialyxir, "~> 1.0.0-rc.3", only: [:dev, :test], runtime: false}
    ]
  end
end
