# # Select2 Instance
Select2Mixins.Selector =
  setSelector: ( selector ) ->
    Match.test selector, String
    @setData 'selector', selector

  # ##### getSelector()
  getSelector: ->
    return @getData().selector or false

  # ##### prepareSelector()
  prepareSelector: ->
    unless @getSelector()
      @setSelector "select2-#{ @getGuid() }"