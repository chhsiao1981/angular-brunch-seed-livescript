mod = {}

mod.AppCtrl = <[$scope $location $resource $rootScope version]> ++ (s, $location, $resource, $rootScope, version) ->
  s <<<< {$location, version}

  s.$watch '$location.path()' (activeNavId or '/') ->
    s <<<< {activeNavId}

  s.getClass = (id) ->
    if (s.activeNavId.substring 0, id.length) is id then 'active' else ''

angular.module 'app.controllers' <[]> .controller mod
