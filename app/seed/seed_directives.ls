#seed = <[]> ++ ->
#  (scope, elem, attrs) ->

#seed = <[]> ++ ->
#  templateUrl: ''
#  replace: false
#  transclude: false,
#  restrict: 'EACM'
#  scope: false
#  link: (scope, elem, attrs) ->

mod = {}

# register the module with Angular
angular.module 'seed.directives' <[seed.services]> .directive mod
