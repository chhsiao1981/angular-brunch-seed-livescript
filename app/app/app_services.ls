# Services
version = 
  -> "0.1"

mod = {version}

the_services = angular.module 'app.services' <[]>
for k, v of mod
  the_services .= factory k, v
