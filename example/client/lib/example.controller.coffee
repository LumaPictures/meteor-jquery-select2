class @ExampleController extends PackageLayoutController
  onBeforeAction: -> super
  data: ->
    @data.select2 =
      options:
        width: 200
    super
  onAfterAction: -> super
  action: -> super