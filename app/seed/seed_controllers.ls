mod = {}

SeedCtrl = <[$scope $location $resource $rootScope]> ++ (s, $location, $resource, $rootScope) ->

mod = { SeedCtrl }

angular.module 'seed.controllers' <[seed.services]> .controller mod