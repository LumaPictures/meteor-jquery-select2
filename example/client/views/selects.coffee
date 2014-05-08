# # selectsView

# ##### selectsView.created()
Template.selectsView.created = -> return

# ##### selectsView.rendered()
Template.selectsView.rendered = -> return

# ##### selectsView.destroyed()
Template.selectsView.destroyed = -> return

# ##### selectsView.helpers()
Template.selectsView.helpers
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
  fullWidthSelect: -> return {
    minimumResultsForSearch: "-1"
    width: "100%"
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

# ##### selectsView.events()
Template .selectsView.events {}