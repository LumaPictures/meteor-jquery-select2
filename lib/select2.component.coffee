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
      @setSelected @selected() if @selected
      if @isDisabled() then @disableSelect2()
      if @isReadOnly() then @readOnlySelect2()
      super

  # ##### created()
  created: ->
    if Meteor.isClient
      super

if Meteor.isClient
  # # Select2 Client
  # ##### Extending the Template
  # `Template.select2` is extended with `Select2Component`'s methods so that the template callbacks can execute
  # `Select2Component` instance methods. In truth `Template.select2` is the actual `Select2Component`.

  # ##### created()
  # This is the component constructor.
  Template.select2.created = -> new Select2Component @