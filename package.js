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

  api.export([], ['client','server']);

  api.add_files([
    'lib/jquery-select2.coffee'
  ], [ 'client', 'server' ]);
});

Package.on_test(function (api) {
  api.use([
    'coffeescript',
    'jquery-select2',
    'tinytest',
    'test-helpers'
  ], ['client', 'server']);

  api.add_files([
    'tests/select2.test.coffee'
  ], ['client', 'server']);
});