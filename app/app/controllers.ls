mod = {}

mod.AppCtrl = <[$scope $location $resource $rootScope version]> ++ (s, $location, $resource, $rootScope, version) ->
  s <<< {$location, version}

  # Uses the url to determine if the selected
  # menu item should have the class active.
  s.$watch '$location.path()' (activeNavId or '/') ->
    s <<< {activeNavId}

  # getClass compares the current url with the id.
  # If the current url starts with the id it returns 'active'
  # otherwise it will return '' an empty string. E.g.
  #
  #   # current url = '/products/1'
  #   getClass('/products') # returns 'active'
  #   getClass('/orders') # returns ''
  #
  s.getClass = (id) ->
    if (s.activeNavId.substring 0, id.length) is id then 'active' else ''

angular.module 'app.controllers' [] .controller mod
