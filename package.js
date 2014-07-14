Package.describe({
  summary: "A Blaze UI select2 component that supports reactive search."
});

Package.on_use(function (api, where) {
  api.use([
    'coffeescript',
    'underscore'
  ],[ 'client', 'server' ]);

  api.use([
    'jquery',
    'ui',
    'templating',
    'spacebars'
  ], [ 'client' ]);

  /* Select2Component Vendor Assets */
  api.add_files([
    'vendor/select2/select2.js'
  ], [ 'client' ]);

  /* Select2Component */
  api.add_files([
    'lib/select2.html'
  ], [ 'client' ]);

  api.add_files([
    'lib/select2.component.coffee'
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
    'tests/select2.tests.coffee'
    /* ADD Select2Component Tests here */
  ], [ 'client', 'server' ]);
});
