# # Select2 Template
# #### `template` String ( optional )
# The name of template that you want to render for this component.
# Default is `default_select2_template` which you can set by setting `Template.select2.defaultTemplate`.
Select2Mixins.Template =
  # ##### Default Template
  defaultTemplate: 'default_select2_template'

  # ##### chooseTemplate()
  # Return the template specified in the component parameters
  chooseTemplate: ( template = null ) ->
    # Set table template to default if no template name is passed in
    template ?= Template.select2.defaultTemplate
    # If the template is defined return it
    if Template[ template ]
      return Template[ template ]
      # Otherwise return the default template
    else return Template[ @defaultTemplate ]