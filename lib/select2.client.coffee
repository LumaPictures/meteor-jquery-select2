# # Select2 Client
# ##### Extending the Template
# `Template.select2` is extended with `Select2Component`'s methods so that the template callbacks can execute
# `Select2Component` instance methods. In truth `Template.select2` is the actual `Select2Component`.
Template.select2 = _.extend Template.select2, Select2Component

# ##### created()
# This is the component constructor.
Template.select2.created = ->
  templateInstance = @
  instantiatedComponent = templateInstance.__component__
  instantiatedComponent.prepareSelector()
  instantiatedComponent.prepareOptions()
  instantiatedComponent.preparePlaceholder()
  instantiatedComponent.log "created", @

# ##### rendered()
# When the component is first rendered the component is initialized  and `templateInstance.__component__` is the `this` context
Template.select2.rendered = ->
  templateInstance = @
  instantiatedComponent = templateInstance.__component__
  instantiatedComponent.log "rendered", @
  instantiatedComponent.initialize()

# ##### destroyed()
# The `Select2Component.destroy()` method is a convenient place to do teardown and cleanup.
Template.select2.destroyed = ->
  templateInstance = @
  instantiatedComponent = templateInstance.__component__
  instantiatedComponent.destroy()
  instantiatedComponent.log "destroyed", @