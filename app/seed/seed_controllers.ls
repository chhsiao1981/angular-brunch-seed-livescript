mod = {}

mod.SeedCtrl = <[$scope $location $resource $rootScope]> ++ (s, $location, $resource, $rootScope) ->

angular.module 'seed.controllers' <[seed.services]> .controller mod