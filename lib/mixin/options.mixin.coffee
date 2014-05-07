# # Select2 Options
# #### `options` Object ( optional )
# `options` are additional options you would like merged with the defaults `_.defaults options, defaultOptions`.
Select2Mixins.Options =
  # ##### setOptions()
  setOptions: ( options ) ->
    Match.test options, Object
    @setData 'options', options

  # ##### getOptions()
  getOptions: ->
    return @getData().options or @getPresetOptions() or false

  # ##### prepareOptions()
  # Prepares the datatable options object by merging the options passed in with the defaults.
  prepareOptions: ->
    options = @getOptions() or {}
    options.component = @
    @setOptions _.defaults( options, @defaultOptions )

  # ##### getPresetOptions()
  # Retrieves any presetOptions objects that have a key matching the component selector
  getPresetOptions: ->
    unless @presetOptions
      if @getSelector() of @presetOptions
        return @presetOptions[ @getSelector() ]
    return false