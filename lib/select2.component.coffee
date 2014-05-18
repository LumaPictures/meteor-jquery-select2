class Select2Component extends Component
  @extend Select2Mixins.Base
  @extend Select2Mixins.EventLogs

  if Meteor.isClient
    # ##### rendered()
    rendered: ->
      if @options then options = @options() else options = {}
      @log "options", options
      @$ = $( @selector() ).select2 options
      @log "$", @$
      if @isDisabled() then @disableSelect2()
      if @isReadOnly() then @readOnlySelect2()
      super