# Filters
mod = {}

mod.interpolate = <[version]> ++ (version) ->
  (text) -> 
    String(text)replace /\%VERSION\%/mg version

[angular.module 'app.filters' <[]> .filter key, val for key, val of mod]
