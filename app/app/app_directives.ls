# Directive

appVersion = <[version]> ++ (version) ->
  (scope, elm, attrs) ->
    elm.text version

mod = {appVersion}

angular.module 'app.directives' <[app.services]> .directive mod
