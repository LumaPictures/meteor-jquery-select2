# # select2ExamplesPanelView

panelBodySelectorId = "select2-examples-panel-selector"

# ##### select2ExamplesPanelView.created()
Template.select2ExamplesPanelView.created = ->
  Session.setDefault panelBodySelectorId, "select2ConfigurationsView"

# ##### select2ExamplesPanelView.rendered()
Template.select2ExamplesPanelView.rendered = -> return

# ##### select2ExamplesPanelView.destroyed()
Template.select2ExamplesPanelView.destroyed = -> return

# ##### select2ExamplesPanelView.helpers()
Template.select2ExamplesPanelView.helpers
  panelBodySelector: -> return {
    id: panelBodySelectorId
    options:
      width: "off"
    tabindex: 1
    debug: "all"
  }
  selectedView: ->
    return Template[ Session.get panelBodySelectorId ]
  options: -> return [{
    value: "select2ConfigurationsView"
    label: "Configurations"
  }, {
    value: "select2DataSourcesView"
    label: "Data Sources"
  }]

events = {}
events[ "change ##{ panelBodySelectorId }" ] = ( event, template ) ->
  Session.set event.target.id, event.val

# ##### select2ExamplesPanelView.events()
Template.select2ExamplesPanelView.events events
