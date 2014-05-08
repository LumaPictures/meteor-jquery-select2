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
    if @isDisabled()
      @disableSelect2()
    if @isReadOnly()
      @readOnlySelect2()

  # ##### disableSelect2()
  disableSelect2: ->
    @setSelect2 $("##{ @getSelector() }").select2( "enable", false )

  # ##### disableSelect2()
  enableSelect2: ->
    @setSelect2 $("##{ @getSelector() }").select2( "enable", true )

  # ##### readOnlySelect2()
  readOnlySelect2: ->
    @setSelect2 $("##{ @getSelector() }").select2( "readonly", true )

  # ##### writableSelect2()
  writableSelect2: ->
    @setSelect2 $("##{ @getSelector() }").select2( "readonly", false )