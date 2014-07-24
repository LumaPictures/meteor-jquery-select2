Template.Select2.rendered = ->
  @data.options ?= {}
  throw new Error "`id` must be defined" unless @data.id
  defaults =
    minimumResultsForSearch: "5"
    width: "100%"
  $( '#'+@data.id ).select2 _.defaults @data.options, defaults
  enabled = @data.options.disabled or true
  readonly = @data.options.readonly or false
  selected = [] unless _.isArray @data.selected and @data.selected.length
  $( '#'+@data.id ).select2 "enable", enabled
  $( '#'+@data.id ).select2 "readonly", readonly
  $( '#'+@data.id ).select2 "val", selected

Template.Select2.destroyed = ->
  $('body .select2-hidden-accessible').remove()
  $('body .select2-sizer').remove()
  $('body .select2-drop').remove()