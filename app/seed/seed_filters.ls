# Filters

mod = {}
mod.seedFilter = <[]> ++ ->
  (params) ->

the_filters = angular.module 'seed.filters' <[seed.services]>
for k, v of mod
  the_filters .= filter k, v
