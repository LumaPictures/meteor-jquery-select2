class Select2Component extends Component
  @extend Select2Mixins.Base
  @extend Select2Mixins.EventLogs

  if Meteor.isClient
    # ##### rendered()
    rendered: ->
      if @options then options = @options() else options = {}
      @log "options", options
      @data.select2 = $( @selector() ).select2 options
      @addGetterSetter 'data', 'select2'
      if @options
        if @options().disabled is true then @disableSelect2()
        if @options().readOnly is true then @readOnlySelect2()
      super