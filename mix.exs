defmodule ExTwilio.Mixfile do
  use Mix.Project

  def project do
    [app: :travis_plt_generator,
     version: "0.0.1",
     elixir: "~> 1.0",
     name: "Travis PLT Generator",
     description: "travis_elixir_plt_generator generates dialyzer plt file for a matrix of otp and elixir releases then deploy using deploy.sh",
     source_url: "https://github.com/linearregression/travis_elixir_plt_generator.git",
     homepage_url: "https://github.com/linearregression/travis_elixir_plt_generator.git",
     dialyzer: [
        plt_add_apps: [:asn1,
          :crypto,
          :edoc,
          :erts,
          :eunit,
          :inets,
          :kernel,
          :mnesia,
          :public_key,
          :ssl,
          :stdlib,
          :xmerl
          ],
       plt_file: "plts/#{plt_filename}",
       flags: ["--no_native"]
     ],
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:dialyxir, "~> 0.3", only: [:dev,:test]}]
  end

  defp plt_filename do
    "otp-#{otp_release}_elixir-#{System.version}.plt"
  end

  defp otp_release do
    case System.get_env("TRAVIS_OTP_RELEASE") do
      nil     -> :erlang.system_info(:otp_release)
      release -> release
    end
  end
end

