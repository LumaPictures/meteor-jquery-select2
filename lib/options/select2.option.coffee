# # Select2Options
# The base options mixin for this component.
# You can either extend this object directly or create additional options mixins.
Select2Options = {}

Select2Options.defaults =
  minimumResultsForSearch: "5"
  width: 200

Select2Options.presets =
  "select-liquid":
    minimumResultsForSearch: "5"
    width: "off"
  "select-full":
    minimumResultsForSearch: "5"
    width: "100%"
  "select-no-search":
    minimumResultsForSearch: "-1"
    width: 200
  "select-multiple":
    minimumResultsForSearch: "5"
    width: "100%"
  "loading-data":
    minimumResultsForSearch: "5"
    placeholder: "Enter at least 3 characters"
    allowClear: true
    minimumInputLength: 3
    query: (query) ->
      data =
        results: []
      i = undefined
      j = undefined
      s = undefined
      i = 1
      while i < 5
        s = ""
        j = 0
        while j < i
          s = s + query.term
          j++
        data.results.push
          id: query.term + i
          text: s

        i++
      query.callback data
  "maximum-select":
    minimumResultsForSearch: "5"
    maximumSelectionSize: 3
    width: "100%"
  "clear-results":
    minimumResultsForSearch: "5"
    allowClear: true
    width: 200
  "minimum-select":
    minimumResultsForSearch: "5"
    minimumInputLength: 2
    width: 200
  "minimum-multiple-select":
    minimumResultsForSearch: "5"
    minimumInputLength: 2
    width: "100%"
  "select-disabled":
    enable: false