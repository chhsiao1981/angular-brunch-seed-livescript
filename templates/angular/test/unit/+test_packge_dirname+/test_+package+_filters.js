(function(){
  describe("{{project}}.filters", function(notIt){
    var filter;
    beforeEach(function(){
      module("{{project}}.filters");
      return inject(function($filter){
        return filter = $filter('filter');
      });
    });
    return it('should filter by string', function(){
      var items;
      items = [
        'MIsKO', {
          name: 'shyam'
        }, ['adam'], 1234
      ];
      expect(filter(items, '').length).toBe(4);
      expect(filter(items, void 8).length).toBe(4);
      expect(filter(items, 'iSk').length).toBe(1);
      expect(filter(items, 'isk')[0]).toBe('MIsKO');
      expect(filter(items, 'yam').length).toBe(1);
      expect(filter(items, 'yam')[0]).toEqual(items[1]);
      expect(filter(items, 'da').length).toBe(1);
      expect(filter(items, 'da')[0]).toEqual(items[2]);
      expect(filter(items, '34').length).toBe(1);
      expect(filter(items, '34')[0]).toBe(1234);
      return expect(filter(items, "I don't exist").length).toBe(0);
    });
  });
}).call(this);
