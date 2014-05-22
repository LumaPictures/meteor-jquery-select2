# # Base Mixin

# Include this mixin in your class like so :

###
  ```coffeescript
    class Whatever extends Component
      @extend Select2Mixins.Base
  ```
###

# Getter setter methods will be created for you instance properties if you add them to the data context in your constructor.

###
  ```coffeescript
    class Whatever extends Component
      @extend Select2Mixins.Base
      constructor: ( context = {} ) ->
        @data.instanceProperty = @instanceProperty
        super
  ```
###

Select2Mixins =
  Base:
    extended: ->
      if Meteor.isClient
        @include
          # ##### defaults
          defaults:
            minimumResultsForSearch: "5"
            width: "100%"

          # ##### isDisabled()
          isDisabled: ->
            if @options then @options().disabled or false

          # ##### isReadOnly()
          isReadOnly: ->
            if @options then @options().readonly or false

          # ##### disableSelect2()
          disableSelect2: ->
            @$.select2 "enable", false
            @log "disabled", true

          # ##### enableSelect2()
          enableSelect2: ->
            @$.select2 "enable", true
            @log "enabled", true

          # ##### readOnlySelect2()
          readOnlySelect2: ->
            @$.select2 "readonly", true
            @log "readOnly", true

          # ##### writableSelect2()
          writableSelect2: ->
            @$.select2 "readonly", false
            @log "writable", true

          setSelected: ( value ) ->
            unless @selected
              @data.selected = null
              @addGetterSetter "data", "selected"
            @selected value
            if @$.select2
              @$.select2 "val", @selected()
              @log "selected", @selected()