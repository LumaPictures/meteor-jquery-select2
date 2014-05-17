Package.describe({
  summary: "A Blaze UI select2 component that supports reactive search."
});

Package.on_use(function (api, where) {
  api.use([
    'coffeescript',
    'underscore',
    'luma-component'
  ],[ 'client', 'server' ]);

  api.use([
    'jquery',
    'ui',
    'templating',
    'spacebars'
  ], [ 'client' ]);

  /* Select2Component Vendor Assets */
  api.add_files([
    'lib/components/select2/vendor/select2/select2.js'
  ], [ 'client' ]);

  /* Select2Component */
  api.export([
    'Select2Mixins',
    'Select2Component'
    /* ADD Select2 Exports here */
  ], [ 'client', 'server' ]);

  api.add_files([
    'lib/components/select2/lib/mixins/base.mixin.coffee'
  ], [ 'client', 'server']);

  api.add_files([
    'lib/components/select2/lib/select2.server.coffee'
  ], [ 'server' ]);

  api.add_files([
    'lib/components/select2/lib/mixins/EventLogs.mixin.coffee'
    /* ADD Select2Component Mixins here */
  ], [ 'client' ]);

  api.add_files([
    'lib/components/select2/lib/select2.component.coffee'
  ], [ 'client', 'server']);

  api.add_files([
    'lib/components/select2/lib/select2.html',
    'lib/components/select2/lib/select2.client.coffee'
  ], [ 'client' ]);
  /* END Select2Component */
});

Package.on_test(function (api) {
  api.use([
    'coffeescript',
    'jquery-select2',
    'tinytest',
    'test-helpers'
  ], ['client', 'server']);

  /* Select2Component Tests */
  api.add_files([
    'lib/components/select2/tests/select2.tests.coffee'
    /* ADD Select2Component Tests here */
  ], [ 'client', 'server' ]);
});
