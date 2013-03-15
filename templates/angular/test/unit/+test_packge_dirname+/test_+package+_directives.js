(function(){
  describe("{{project}}.directives", function(notIt){
    var element;
    beforeEach(function(){
      return module("{{project}}.directives");
    });
    afterEach(function(){
      return dealoc(element);
    });
    it("should be always true", function(){
      return expect("").toBe("");
    });
    it("should be always false", function(){
      return expect("").toBe("1");
    });
    it("should set the style as expected style", inject(function($rootScope, $compile){
      element = $compile('<div ng-style="{height: \'40px\'}"></div>')($rootScope);
      $rootScope.$digest();
      return expect(element.css('height')).toEqual('40px');
    }));
    return it("should switch on value change", inject(function($rootScope, $compile){
      element = $compile('<div ng-switch="select">' + '<div ng-switch-when="1">first:{{name}}</div>' + '<div ng-switch-when="2">second:{{name}}</div>' + '<div ng-switch-when="true">true:{{name}}</div>' + '</div>')($rootScope);
      expect(element.html()).toEqual('<!-- ngSwitchWhen: 1 --><!-- ngSwitchWhen: 2 --><!-- ngSwitchWhen: true -->');
      $rootScope.select = 1;
      $rootScope.$apply();
      expect(element.text()).toEqual('first:');
      $rootScope.name = "shyam";
      $rootScope.$apply();
      expect(element.text()).toEqual('first:shyam');
      $rootScope.select = 2;
      $rootScope.$apply();
      expect(element.text()).toEqual('second:shyam');
      $rootScope.name = 'misko';
      $rootScope.$apply();
      expect(element.text()).toEqual('second:misko');
      $rootScope.select = true;
      $rootScope.$apply();
      return expect(element.text()).toEqual('true:misko');
    }));
  });
}).call(this);
