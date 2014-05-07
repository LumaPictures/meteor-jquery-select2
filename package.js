Package.describe({
  summary: "A Blaze UI select2 component that supports reactive search."
});

Package.on_use(function (api, where) {
  api.use([
    'coffeescript',
    'underscore'
  ],[ 'client', 'server' ]);

  // for helpers
  api.use([
    'jquery',
    'ui',
    'templating',
    'spacebars'
  ], [ 'client' ]);

  api.export([
    'Select2Mixins',
    'Select2Options',
    'Select2Component'
  ], ['client','server']);

  /* External Libraries */
  api.add_files([], ['client']);

  /* Mixins */
  api.add_files([
    'lib/mixins/select2.mixin.coffee',
    'lib/mixins/debug.mixin.coffee'
  ], [ 'client', 'server' ]);

  api.add_files([
    'lib/mixins/initialize.mixin.coffee',
    'lib/mixins/destroy.mixin.coffee',
    'lib/mixins/options.mixin.coffee',
    'lib/mixins/selector.mixin.coffee',
    'lib/mixins/template.mixin.coffee',
    'lib/mixins/utility.mixin.coffee'
  ], [ 'client' ]);

  /* Options */
  api.add_files([
    'lib/options/select2.option.coffee'
  ], [ 'client', 'server' ]);

  /* Component */
  api.add_files([
    'lib/select2.component.coffee'
  ], [ 'client', 'server']);

  api.add_files([
    'lib/select2.html',
    'lib/select2.client.coffee'
  ], [ 'client' ]);

  /* Plugins */
  api.add_files([], [ 'client' ]);
});

Package.on_test(function (api) {
  api.use([
    'coffeescript',
    'jquery-select2',
    'tinytest',
    'test-helpers'
  ], ['client', 'server']);

  api.add_files([
    'tests/select2.options.mixin.test.coffee',
    'tests/select2.template.mixin.test.coffee'
  ], ['client', 'server']);
});
