# # Select2 Client
Template.select2 = _.extend Template.select2, Select2Component

# ##### rendered()
# When the component is first rendered datatables is initialized `templateInstance.__component__` is the this context
Template.select2.rendered = ->
  templateInstance = @
  instantiatedComponent = templateInstance.__component__
  instantiatedComponent.log "rendered", @
  instantiatedComponent.initialize()

# ##### created()
Template.select2.created = ->
  templateInstance = @
  instantiatedComponent = templateInstance.__component__
  instantiatedComponent.prepareSelector()
  instantiatedComponent.prepareOptions()
  instantiatedComponent.log "created", @

# ##### destroyed()
# Currently nothing is done when the component is destroyed.
Template.select2.destroyed = ->
  templateInstance = @
  instantiatedComponent = templateInstance.__component__
  instantiatedComponent.destroy()
  instantiatedComponent.log "destroyed", @