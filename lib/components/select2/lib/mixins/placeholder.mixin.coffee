# # Select2 Placeholder
Select2Mixins.Placeholder =
  # ##### setPlaceholder()
  setPlaceholder: ( placeholder ) ->
    Match.test placeholder, String
    @setData 'placeholder', placeholder

  # ##### preparePlaceholder()
  preparePlaceholder: ->
    @setPlaceholder @getPlaceholder()

  # ##### getPlaceholder()
  getPlaceholder: ->
    return @getData().placeholder or @getOptions().placeholder or false