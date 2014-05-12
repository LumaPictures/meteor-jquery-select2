# # Select2Mixins
# The base mixin for this component
Select2Mixins = {}

Select2Mixins.Base =
  # ##### isDisabled()
  isDisabled: ->
    if @getOptions().disabled
      @log "disabled", @getOptions().disabled
    return @getOptions().disabled or false

  # ##### isReadOnly()
  isReadOnly: ->
    if @getOptions().readOnly
      @log "readonly", @getOptions().readOnly
    return @getOptions().readOnly or false