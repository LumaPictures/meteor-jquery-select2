if Meteor.isClient
  Tinytest.add "Select2 - default options", ( test ) ->
    test.notEqual Template.select2.defaultOptions, undefined, "Expected defaultOptions to be defined on the client."