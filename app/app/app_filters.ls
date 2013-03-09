# Filters
mod = {}

mod.interpolate = <[version]> ++ (version) ->
  (text) -> 
    String(text)replace /\%VERSION\%/mg version

mod.temp = <[version]> ++ (version) ->
  (text) -> 
    String(text)replace /\%VERSION\%/mg version

mod.appFilter = <[version]> ++ (version) ->
  (text) -> 
    String(text)replace /\%VERSION\%/mg version

app_filters = angular.module 'app.filters' <[]>
for k, v of mod
  app_filters .= filter k, v
