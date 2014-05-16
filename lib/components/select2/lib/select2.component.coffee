class Select2Component extends Component
  defaults:
    minimumResultsForSearch: "5"
    width: "100%"

  # ##### rendered()
  rendered: ->
    if @options then options = @options() else options = {}
    @log "options", options
    @data.select2 = $( "##{ @selector() }" ).select2 options
    @addGetterSetter 'data', 'select2'
    if @options
      if @options().disabled is true then @disableSelect2()
      if @options().readOnly is true then @readOnlySelect2()
    super

  # ##### disableSelect2()
  disableSelect2: ->
    @select2 $("##{ @selector() }").select2( "enable", false )

  # ##### disableSelect2()
  enableSelect2: ->
    @select2 $("##{ @selector() }").select2( "enable", true )

  # ##### readOnlySelect2()
  readOnlySelect2: ->
    @select2 $("##{ @selector() }").select2( "readonly", true )

  # ##### writableSelect2()
  writableSelect2: ->
    @select2 $("##{ @selector() }").select2( "readonly", false )