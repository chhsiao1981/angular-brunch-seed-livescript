describe "filter", (not-it) ->
  beforeEach ->
    module "app.filters"
    module "app.services"

  describe "interpolate", (not-it) ->
    beforeEach ->
      module ($provide) ->
        $provide.value "version", "TEST_VER"
        return

    it "should replace VERSION", inject (interpolateFilter) ->
      expect(interpolateFilter "before %VERSION% after") .toBe "before TEST_VER after"

    it "should be true", ->
      expect(1) .toEqual 1


