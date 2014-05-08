# # Select2 Instance
Select2Mixins.Initialize =
  # ##### initialize()
  initialize: ->
    @initializeSelect2()
    @log "initialized", @

  # ##### setSelect2()
  setSelect2: ( select2 ) ->
    Match.test select2, Object
    @setData 'select2', select2

  # ##### initializeSelect2()
  initializeSelect2: ->
    @setSelect2 $("##{ @getSelector() }").select2( @getOptions() )