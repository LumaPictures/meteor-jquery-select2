# # select2ExamplesPanelView

# ##### select2ExamplesPanelView.created()
Template.select2ExamplesPanelView.created = ->
  Session.setDefault "select2-examples-panel-selector", "configurations"

# ##### select2ExamplesPanelView.rendered()
Template.select2ExamplesPanelView.rendered = -> return

# ##### select2ExamplesPanelView.destroyed()
Template.select2ExamplesPanelView.destroyed = -> return

# ##### select2ExamplesPanelView.helpers()
Template.select2ExamplesPanelView.helpers
  selectedView: ->
    return Template[ Session.get "select2-examples-panel-selector" ]

# ##### select2ExamplesPanelView.events()
Template .select2ExamplesPanelView.events
  "change #select2-examples-panel-selector": ( event, template ) ->
    Session.set event.target.id, event.val