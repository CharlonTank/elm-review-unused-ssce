module ReviewConfig exposing (config)

import NoUnused.Parameters
import Review.Rule exposing (Rule)


config : List Rule
config =
    [ NoUnused.Parameters.rule
    ]
