if Meteor.isClient
  Tinytest.add "Select2 - chooseTemplate()", ( test ) ->
    test.notEqual Template[ Template.select2.defaultTemplate ], undefined, "Expected the default_select2_template to be defined."
    test.equal Template.select2.chooseTemplate(), Template[ Template.select2.defaultTemplate ], "Calling chooseTemplate without a param returns the default_select2_template."
    test.notEqual Template.select2.chooseTemplate('undefined_template'), undefined, "chooseTemplate() should never return undefined."
    # stub some_template being defined
    Template['some_template'] = true
    test.equal Template.select2.chooseTemplate('some_template'), Template['some_template'], "Passing a template name to chooseTemplate() returns that template."