# # Eventlogs Mixin

# Include this mixin in your class like so :

###
  ```coffeescript
    class Whatever extends Component
      @extend Select2Mixins.Eventlogs
  ```
###

# Getter setter methods will be created for you instance properties if you add them to the data context in your constructor.

###
  ```coffeescript
    class Whatever extends Component
      @extend Select2Mixins.Eventlogs
      constructor: ( context = {} ) ->
        @data.instanceProperty = @instanceProperty
        super
  ```
###

# ## Function

# The EventLogs Mixin provides basic logging for all select2 initiated events.
# These events can be overriden by another mixin that is included after or by events on the base class.

# ## Debugging Events

# All events can be used by the debug log catch alls "all" and "events".
# A specific event can be monitored by "<evenName>".

###
  {{#select2 debug="change" }}
    <option value="1" selected>one</option>
    <option vaule="2">two</option>
  {{/select2}}
###

Select2Mixins.EventLogs =
  extended: ->
    if Meteor.isClient
      @include
        events:
          "change select": ( event, template ) ->
            template.log "event:change", {
              val:event.val
              added:event.added
              removed:event.removed
            }

          "select2-opening": ( event, template ) -> template.log "event:opening"

          "select2-open": ( event, template ) -> template.log "event:open"

          "select2-close": ( event, template ) -> template.log "event:close"

          "select2-highlight": ( event, template )->
            template.log "event:highlighted", {
              val: event.val
              choice: event.choice
            }

          "select2-selecting": ( event, template ) ->
            template.log "event:selecting", {
              val: event.val
              choice: event.choice
            }

          "select2-removing": ( event, template ) ->
            template.log "event:removing", {
              val: event.val
              choice: event.choice
            }

          "select2-removed": ( event, template ) ->
            template.log "event:removed", {
              val: event.val
              choice: event.choice
            }

          "select2-loaded": ( event, template ) -> template.log "event:loaded (data property omitted for brevity)"

          "select2-focus": ( event, template ) -> template.log "event:focus"

          "select2-blur": ( event, template ) -> template.log "event:blur"