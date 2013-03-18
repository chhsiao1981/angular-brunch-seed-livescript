version = <[]> ++ ->
  "0.1"

mod = {version}

the_services = angular.module 'seed.services' <[]>
[the_services .= factory k, v for k, v of mod]
