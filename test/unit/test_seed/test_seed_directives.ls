describe "seed.directives", (not-it) ->
  var $http_backend

  beforeEach ->
    module "seed.directives"

  beforeEach ->
    module "_public/partials/app/nav.html"

  beforeEach ->
    module ($provide) ->
      $provide .value "HTTP_PREFIX", '_public'
      return

  beforeEach inject ($injector) ->
    $http_backend := $injector .get '$httpBackend'
    $http_backend .when 'GET', '/img/temp.png' .respond ''

  it "should be always true", ->
    expect("") .toBe ""

  it "should set the style as expected style", inject ($rootScope, $compile) ->
    element = $compile('<div ng-style="{height: \'40px\'}"></div>') $rootScope
    $rootScope .$digest!
    expect (element .css 'height') .toEqual '40px'

  it "should switch on value change", inject ($rootScope, $compile) ->
    element = $compile('<div ng-switch="select">' +
      '<div ng-switch-when="1">first:{{name}}</div>' +
      '<div ng-switch-when="2">second:{{name}}</div>' +
      '<div ng-switch-when="true">true:{{name}}</div>' +
      '</div>') $rootScope

    expect (element .html!) 
      .toEqual '<!-- ngSwitchWhen: 1 --><!-- ngSwitchWhen: 2 --><!-- ngSwitchWhen: true -->'
    $rootScope.select = 1
    $rootScope .$apply!
    expect (element.text!) .toEqual 'first:'
    $rootScope.name = "shyam"
    $rootScope .$apply!
    expect (element.text!) .toEqual 'first:shyam'
    $rootScope.select = 2;
    $rootScope .$apply!
    expect (element.text!) .toEqual 'second:shyam'
    $rootScope.name = 'misko'
    $rootScope .$apply!
    expect (element.text!) .toEqual 'second:misko'
    $rootScope.select = true;
    $rootScope .$apply!
    expect (element.text!) .toEqual 'true:misko'
