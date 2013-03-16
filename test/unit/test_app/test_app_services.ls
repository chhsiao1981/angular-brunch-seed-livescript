describe "app.services", (not-it) ->
  beforeEach ->
    module "app.services"
  
  describe "version", (not-it) ->
    it "should return current version", inject (version) ->
      expect(version).toEqual "0.1"
