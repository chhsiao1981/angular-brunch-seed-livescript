# Directive

mod = {}
mod.appVersion = <[version]> ++ (version) ->
  (scope, elm, attrs) ->
    elm.text version

angular.module 'app.directives' <[app.services]> .directive mod
