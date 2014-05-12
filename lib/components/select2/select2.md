# Select2 Component

## Setup

In order to include this component in your package you must add the following to you `package.js` `on_use` callback.

```javascript
  /* Select2Component */
  api.export([
    'Select2Mixins',
    'Select2Component'
    /* ADD Select2 Exports here */
  ], [ 'client', 'server' ]);

  api.add_files([
    'lib/components/select2/lib/mixins/base.mixin.coffee',
    'lib/components/select2/lib/mixins/debug.mixin.coffee'
  ], [ 'client', 'server']);

  api.add_files([
    'lib/components/select2/lib/select2.server.coffee'
  ], [ 'server' ]);

  api.add_files([
    'lib/components/select2/lib/mixins/initialize.mixin.coffee',
    'lib/components/select2/lib/mixins/destroy.mixin.coffee',
    'lib/components/select2/lib/mixins/options.mixin.coffee',
    'lib/components/select2/lib/mixins/selector.mixin.coffee',
    'lib/components/select2/lib/mixins/utility.mixin.coffee'
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
```

Add the following to your `package.js` `on_test` callback.

```javascript
  /* Select2Component Tests */
  api.add_files([
    'lib/components/select2/tests/select2.tests.coffee'
    /* ADD Select2Component Tests here */
  ], [ 'client', 'server' ]);
```

# Extend

In order to extend this component with your own mixins you must.

1. Create your own mixin file or add the methods to the `Base` mixin

2. If you added a mixin file you must include it in your `package.js` at the location marked `ADD Select2Component Mixins here`.

3. If you added a new mixin namespace you must extend the component in `lib/components/select2/lib/select2.component.coffee`
    at the location marked `# Add additional client mixin namespaces here` and `# Add additional client mixin namespaces here`
    depending on the intended use.

## Vendor

Any vendor assets must be placed in the vendor directory and included in you `package.js`

```javascript
  /* Select2Component Vendor Assets */
  api.add_files([
    'lib/components/select2/vendor/example_vendor_file.min.js'
  ], [ 'client' ]);
```
