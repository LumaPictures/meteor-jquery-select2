# jquery-select2 [![Build Status](https://travis-ci.org/LumaPictures/meteor-jquery-select2.svg?branch=master)](https://travis-ci.org/LumaPictures/meteor-jquery-select2)
### A Blaze UI select2 component that supports reactive search.

## [Live Example](http://jquery-select2.meteor.com)

## Local Example
```
$ git clone https://github.com/LumaPictures/meteor-jquery-select2
$ cd LumaPictures/meteor-jquery-select2
$ mrt && meteor
```

## Local Tests
```
$ git clone https://github.com/LumaPictures/meteor-jquery-select2
$ cd LumaPictures/meteor-jquery-select2
$ mrt && meteor test-packages jquery-select2
```

## Usage

### Initialization

Initializing a select2 component is easy, just include the following block helper in one of your templates.

```html
{{#select2 placeholder="Choose a Country" }}
    {{#each country }}
        <option value="{{countryCode}}">{{name}}</option>
    {{/each}}
{{/select2}}
```

If you need opt groups everything still works the same.

```html
{{#select2 placeholder="Choose a State" }}
    {{#each timezone }}
        <optgroup label="{{name}}">
            {{#each states}}
                <option value="{{stateCode}}">{{name}}</option>
            {{/each}}
        </optgroup>
    {{/each}}
{{/select2}}
```

### Events

There are two ways you can bind events to a select2 component.

1. Provide a selector and use jQuery / Template events ( note all selectors must be unique in the page scope )
    * This technique is useful when a selector needs to respond to external changes

```html
<input type="button" id="destroy-the-world" class="btn" value="KABOOM!">
{{#select2 placeholder="Choose a Country" selector="the-world" }}
    {{> countries }}
{{/select2}}
```

```coffeescript
$("#destroy-the-world").click -> $("#the-world").select2 "destroy"
```

2. Pass in your own event map through the component ( does not require a selector to be defined )
    * This technique is useful when you need to perform custom actions on selection events

```html
{{#select2 placeholder="Choose a Country" selector="the-world" events=logAllEvents }}
    {{> countries }}
{{/select2}}
```

```coffeescript
logAllEvents =
    "change": ( event ) -> console.log "change "+JSON.stringify({val:event.val, added:event.added, removed:event.removed})
    "select2-opening": -> console.log "opening"
    "select2-open": -> console.log "open"
    "select2-close": -> console.log "close"
    "select2-highlight": ( event ) -> console.log "highlighted val="+ event.val+" choice="+ JSON.stringify(event.choice)
    "select2-selecting": ( event ) -> console.log "selecting val="+ event.val+" choice="+ JSON.stringify(event.choice)
    "select2-removing": ( event ) -> console.log "removing val="+ event.val+" choice="+ JSON.stringify(event.choice)
    "select2-removed": ( event ) -> console.log "removed val="+ event.val+" choice="+ JSON.stringify(event.choice)
    "select2-loaded": ( event ) -> console.log "loaded (data property omitted for brevity)"
    "select2-focus": ( event ) -> console.log "focus"
    "select2-blur": ( event ) -> console.log "blur"
```

Note: This method is identical to specifying a selector and saying

```javascript
$("#your-selector")
    .on("change", function(e) { log("change "+JSON.stringify({val:e.val, added:e.added, removed:e.removed})); })
    .on("select2-opening", function() { log("opening"); })
    .on("select2-open", function() { log("open"); })
    .on("select2-close", function() { log("close"); })
    .on("select2-highlight", function(e) { log ("highlighted val="+ e.val+" choice="+ JSON.stringify(e.choice));})
    .on("select2-selecting", function(e) { log ("selecting val="+ e.val+" choice="+ JSON.stringify(e.choice));})
    .on("select2-removing", function(e) { log ("removing val="+ e.val+" choice="+ JSON.stringify(e.choice));})
    .on("select2-removed", function(e) { log ("removed val="+ e.val+" choice="+ JSON.stringify(e.choice));})
    .on("select2-loaded", function(e) { log ("loaded (data property omitted for brevity)");})
    .on("select2-focus", function(e) { log ("focus");})
    .on("select2-blur", function(e) { log ("blur");});
```

## Styling

This package provides no styles or assets to your app intentionally.

All of the default select2 styles and assets are included in the `vendor` directory and can be loaded into your application via the following methods:

1. Load files by path ( this assumes your less / css files are one dir up from your app root )

`@import "../packages/jquery-select2/vendor/select2/select2.css";`

2. Symlink the whole library

```shell
$ cd public && ln -s ../packages/jquery-select2/vendor/select2 ./
```

## Contributing