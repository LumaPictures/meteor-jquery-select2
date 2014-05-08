# # Select2 Utility
Select2Mixins.Utility =
  # ##### getTemplateInstance()
  getTemplateInstance: ->
    return @templateInstance or false

  # ##### getGuid()
  getGuid: ->
    return @guid or false

  # ##### getData()
  getData: ->
    return @getTemplateInstance().data or false

  # ##### setData()
  setData: ( key, data ) ->
    @templateInstance.data[ key ] = data
    @log "#{ key }:set", data

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