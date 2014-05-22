class Select2Component extends Component
  __name__: "Select2Component"
  @extend Select2Mixins.Base
  @extend Select2Mixins.EventLogs

  # ##### rendered()
  rendered: ->
    if Meteor.isClient
      if @options then options = @options() else options = {}
      @log "options", options
      @log "selector", @selector()
      @$ = $( @selector() ).select2 options
      @log "$", @$
      @setSelected @selected()
      if @isDisabled() then @disableSelect2()
      if @isReadOnly() then @readOnlySelect2()
      super

  # ##### created()
  created: ->
    if Meteor.isClient
      super