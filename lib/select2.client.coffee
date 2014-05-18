# # Select2 Client
# ##### Extending the Template
# `Template.select2` is extended with `Select2Component`'s methods so that the template callbacks can execute
# `Select2Component` instance methods. In truth `Template.select2` is the actual `Select2Component`.

# ##### created()
# This is the component constructor.
Template.select2.created = -> new Select2Component @

# ##### rendered()
Template.select2.rendered = -> @rendered()

# ##### destroyed()
Template.select2.destroyed = -> @destroyed()