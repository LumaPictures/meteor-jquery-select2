# # select2DataSourcesView

# ##### select2DataSourcesView.created()
Template.select2DataSourcesView.created = -> return

# ##### select2DataSourcesView.rendered()
Template.select2DataSourcesView.rendered = -> return

# ##### select2DataSourcesView.destroyed()
Template.select2DataSourcesView.destroyed = -> return

# ##### select2DataSourcesView.helpers()
Template.select2DataSourcesView.helpers
  ArraySource: -> return {
    placeholder: "Select an Option..."
    tabindex: 3
    options:
      data:
        results: [{
          id: 0
          tag: "enhancement"
        }, {
          id: 1
          tag: "bug"
        }, {
          id: 2
          tag: "duplicate"
        }, {
          id: 3
          tag: "invalid"
        }, {
          id: 4
          tag: "wontfix"
        }]
        text: ( item ) -> item.tag
      formatSelection: ( item ) -> item.tag
      formatResult: ( item ) -> item.tag
  }

# ##### select2DataSourcesView.events()
Template .select2DataSourcesView.events {}
