{ name = "jest"
, dependencies =
  [ "aff"
  , "aff-promise"
  , "effect"
  , "prelude"
  , "psci-support"
  , "foldable-traversable"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
