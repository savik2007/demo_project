use Mix.Releases.Config,
    default_release: :default,
    default_environment: Mix.env()

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  # If you are running Phoenix, you should make sure that
  # server: true is set and the code reloader is disabled,
  # even in dev mode.
  # It is recommended that you build with MIX_ENV=prod and pass
  # the --env flag to Distillery explicitly if you want to use
  # dev mode.
  set dev_mode: true
  set include_erts: false
  set cookie: :"^b3:EfV{u>Rfx??JgrRw^6lTO{hpptpS]|Yv2hm~>N[IB><XvyF{ZShn*_rxDUZo"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :";W^JBe|r10%%>?@&Y8XgVeZwH9kJ?w?bO/bl1!gjiD(P.<;2IkIz,[o<Mox:<.qg"
end

environment :test do
  set include_erts: true
  set include_src: false
  set cookie: :";W^JBe|r10%%>?@&Y8XgVeZwH9kJ?w?bO/bl1!gjiD(P.<;2IkIz,[o<Mox:<.qg"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :demo_project do
  set version: "0.1.0"
  set applications: [
    :runtime_tools,
        greeter: :permanent,
        demo_aph: :permanent
  ]
end

