mod = {}

#mod.seedDirective = <[]> ++ ->
#  (scope, elem, attrs) ->

#mod.seedDirective = <[]> ++ ->
#  templateUrl: ''
#  replace: false
#  transclude: false,
#  restrict: 'EACM'
#  scope: false
#  link: (scope, elem, attrs) ->
    

# register the module with Angular
angular.module 'seed.directives' <[seed.services]> .directive mod
