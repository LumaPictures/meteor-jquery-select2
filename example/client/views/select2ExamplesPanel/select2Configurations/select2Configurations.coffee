# # select2ConfigurationsView

# ##### select2ConfigurationsView.created()
Template.select2ConfigurationsView.created = ->
  Session.set "reactive-select", "AK"

# ##### select2ConfigurationsView.rendered()
Template.select2ConfigurationsView.rendered = -> return

# ##### select2ConfigurationsView.destroyed()
Template.select2ConfigurationsView.destroyed = -> return

# ##### select2ConfigurationsView.helpers()
Template.select2ConfigurationsView.helpers
  countryPlaceholder: -> return "Choose a Country..."
  teamsPlaceholder: -> return "Your Favorite Football Team"
  statePlaceholder: -> return "Choose a State..."
  fixedSelect: -> return {
    minimumResultsForSearch: "-1"
  }
  liquidSelect: -> return {
    minimumResultsForSearch: "-1"
    width: "off"
  }
  disabledSelect: -> return {
    disabled: true
  }
  clearResults: -> return {
    allowClear: true
  }
  minimumSelect: -> return {
    minimumInputLength: 2
  }
  minimumMultipleSelect: -> return {
    minimumInputLength: 2
    width: "100%"
  }
  maximumMultipleSelect: -> return {
    maximumSelectionSize: 2
    width: "100%"
  }
  reactiveSelection: -> return Session.get "reactive-select"

# ##### select2ConfigurationsView.events()
Template .select2ConfigurationsView.events
  "click .reactive-select": ( event, template ) ->
    event.preventDefault()
    Session.set "reactive-select", $( event.target ).data "button"

  "change #reactive-select": ( event, template ) ->
    Session.set "reactive-select", event.val
