Template.Select2.rendered = ->
  @data.options ?= {}
  throw new Error "`id` must be defined" unless @data.id
  defaults =
    minimumResultsForSearch: "5"
    width: "100%"
  $select2 = $( 'select#'+@data.id ).select2 _.defaults @data.options, defaults
  $select2.select2 "enable", @data.options.disabled if @data.options.disabled
  $select2.select2 "readonly", @data.options.readonly if @data.options.readonly
  $select2.select2 "val", @data.selected if @data.selected

Template.Select2.destroyed = ->
  $('body .select2-hidden-accessible').remove()