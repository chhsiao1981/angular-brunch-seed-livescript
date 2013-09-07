AppCtrl = <[$scope $location $resource $rootScope version]> ++ (s, $location, $resource, $rootScope, version) ->
  s <<<< {$location, version}

  s.$watch '$location.path()' (active-nav-id or '/') ->
    s <<<< {active-nav-id}

  s.getClass = (id) ->
    if (s.active-nav-id.substring 0, id.length) is id then 'active' else ''

mod = {AppCtrl}

angular.module 'app.controllers' <[app.services]> .controller mod
