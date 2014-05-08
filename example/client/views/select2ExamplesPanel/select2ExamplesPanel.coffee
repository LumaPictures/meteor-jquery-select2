# # select2ExamplesPanelView

# ##### select2ExamplesPanelView.created()
Template.select2ExamplesPanelView.created = -> return

# ##### select2ExamplesPanelView.rendered()
Template.select2ExamplesPanelView.rendered = -> return

# ##### select2ExamplesPanelView.destroyed()
Template.select2ExamplesPanelView.destroyed = -> return

# ##### select2ExamplesPanelView.helpers()
Template.select2ExamplesPanelView.helpers
  selector: -> return "select2-examples-panel-selector"
  selectedView: ->
    return Template[ Session.get Template.select2ExamplesPanelView.selector() ]
  options: -> return [{
    value: "select2ConfigurationsView"
    label: "Configurations"
  }, {
    value: "select2DataSourcesView"
    label: "Data Sources"
  }]

# ##### select2ExamplesPanelView.events()
Template.select2ExamplesPanelView.events
  "change #select2-examples-panel-selector": ( event, template ) ->
    Session.set event.target.id, event.val
