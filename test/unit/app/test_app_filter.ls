describe "app.filters", (not-it) ->
  beforeEach ->
    module "app.filters"
  
  describe "interpolate", (not-it)->
    beforeEach ->
      module ($provide) ->
        $provide.value "version", "TEST_VER"
        return

    it "should replace VERSION", inject (interpolateFilter)->
      expect(interpolateFilter "before %VERSION% after") .toEqual "before TEST_VER after"