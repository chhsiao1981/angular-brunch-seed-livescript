describe "service", (not-it) ->
  beforeEach ->
    module "app.services"

  describe "service", (not-it) ->
    it "should return current version", inject (version) ->
      expect(version) .toEqual "0.1"
