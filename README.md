# jquery-select2 [![Build Status](https://travis-ci.org/LumaPictures/meteor-jquery-select2.svg?branch=master)](https://travis-ci.org/LumaPictures/meteor-jquery-select2)
### A Blaze UI select2 component that supports reactive search.

## [Official Docs](http://ivaynberg.github.io/select2/)
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

Generally I prefer to setup my initialization parameters in a template helper and pass in a complete initialization object.

```coffeescript
Template.taskForm.helpers
  formSelectorDefaultOptions: -> return {
    width: "100%"
  }
  taskTypeSelector: -> return {
    placeholder: "Select a task type"
    tabindex: 1
    options: Template.taskForm.formSelectorDefaultOptions()
  }
```

Example form using the selector defined above

```html
<template name="taskForm">
    <form role="form">
        <div class="modal-body with-padding">
            <div class="block-inner text-danger">
                <h6 class="heading-hr">Tasksheet Entry <small class="display-block">Please select a task type.</small>
                    {{#select2 taskTypeSelector }}
                        <option value="art">Artist</option>
                        <option value="dev">Dev</option>
                        <option valule="sys">Systems</option>
                        <option value="ops">Ops</option>
                        <option value="mgmt">Management</option>
                    {{/select2}}
                </h6>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-sm-6">
                        <label>Hours</label>
                        <input class="form-control" type="number" name="number">
                    </div>
                    <div class="col-sm-6">
                        <label>Minutes</label>
                        <input class="form-control" type="number" name="number">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-sm-12">
                        <label>Notes</label>
                        <textarea rows="5" cols="5" class="limited form-control" placeholder="Limited to 100 characters"></textarea>
                        <span class="help-block" id="limit-text">Field limited to 100 characters.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-success" data-dismiss="modal">Submit</button>
        </div>
    </form>
</template>
```

### Data Sources

#### DOM

The easiest and least flexible way. Just place your options in the `select2` block helper and go.

If you are not using a placeholder be sure to specify which option is selected by default or the `select2` component will be empty.

```html
{{#select2}}
    <option value="option1" selected>Option 1</option>
    <option value="option2">Option 2</option>
{{/select2}}
```

#### Array ( [milestone v0.2](https://github.com/LumaPictures/meteor-jquery-select2/issues?milestone=1&state=open) )

This method will cover most of your use cases, is quite flexible, and pretty freakin simple.

By default the first element in the array will be selected unless you specify a placeholder.

```html
{{> select2 optionsArray=optionsArray }}
```

#### Subscription ( [milestone v0.3](https://github.com/LumaPictures/meteor-jquery-select2/issues?milestone=2&state=open) )

The most complex and powerful option of the three, very useful when you have a large set of options that is stored in a collection.

This package automatically pages and searches extremely large collections by performing all searches on the server and providing
its own publication. This works in a very similar fashion to my [ jquery-datatables package ](https://atmospherejs.com/package/jquery-datatables).

```html
{{> select2 subscription="all_countries" }}
```

On the server you will have to publish a `Select2Component` publication or provide your own searchable publication.

```coffeescript
Select2Component.publish "all_countries", Countries, {}
```

### Events

There are several ways you can bind events to a select2 component.

###### Provide a selector and use `Template.yourView.events`

Assuming you have a template view like this :

```html
<template name="yourView">
    {{#panel}}
        {{#select2 id="country-selector" }}
            {{> countries }}
        {{/select2}}
    {{/panel}}
</template>
```

```coffeescript
Template .select2ExamplesPanelView.events
  "change #country-selector": ( event, template ) ->
    console.log "change", {
      val:event.val
      added:event.added
      removed:event.removed
    }
  "select2-opening #country-selector": ( event, template ) ->
    console.log "opening"
  "select2-open #country-selector": ( event, template ) ->
    console.log "open"
  "select2-close #country-selector": ( event, template ) ->
    console.log "close"
  "select2-highlight #country-selector": ( event, template )->
    console.log "highlighted", {
      val: event.val
      choice: event.choice
    }
  "select2-selecting #country-selector": ( event, template ) ->
    console.log "selecting", {
      val: event.val
      choice: event.choice
    }
  "select2-removing #country-selector": ( event, template ) ->
    console.log "removing", {
      val: event.val
      choice: event.choice
    }
  "select2-removed #country-selector": ( event, template ) ->
    console.log "removed", {
      val: event.val
      choice: event.choice
    }
  "select2-loaded #country-selector": ( event, template ) ->
    console.log "loaded (data property omitted for brevity)"
  "select2-focus #country-selector": ( event, template ) ->
    console.log "focus"
  "select2-blur #country-selector": ( event, template ) ->
    console.log "blur"
```

A non trivial usage, and what is currently being used in the example app.

```html
<template name="select2ExamplesPanelView">
    {{#panel styles="panel-default select2-examples-panel" }}
        {{#panelHeading icon="icon-menu5" title="Select2" }}
            <div class="pull-left">
                {{#select2 id=id tabindex="1"}}
                    {{#each options }}
                        <option value="{{value}}">{{label}}</option>
                    {{/each}}
                {{/select2}}
            </div>
        {{/panelHeading}}
        {{#panelBody}}
            {{> selectedView }}
        {{/panelBody}}
    {{/panel}}
</template>
```

```coffeescript
Template.select2ExamplesPanelView.helpers
  id: -> return "select2-examples-panel-selector"
  selectedView: ->
    return Template[ Session.get Template.select2ExamplesPanelView.selector() ]
  options: -> return [{
    value: "select2ConfigurationsView"
    label: "Configurations"
  }, {
    value: "select2DataSourcesView"
    label: "Data Sources"
  }]

Template.select2ExamplesPanelView.events
  "change #select2-examples-panel-selector": ( event, template ) ->
    Session.set event.target.id, event.val
```

###### Provide a selector and use jQuery
    * This technique is useful when a selector needs to respond to external changes
    * NOTE : All selectors must be unique in the page scope

```html
<input type="button" id="destroy-the-world" class="btn" value="KABOOM!">
{{#select2 placeholder="Choose a Country" selector="the-world" }}
    {{> countries }}
{{/select2}}
```

```coffeescript
$("#destroy-the-world").click -> $("#the-world").select2 "destroy"
```

###### Pass in your own event map through the component ( [ milestone v0.4 ](https://github.com/LumaPictures/meteor-jquery-select2/issues?milestone=3&state=open) )
    * This technique is useful when you need to perform custom actions on selection events
    * Does not require a selector to be defined

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
    .on("change", function(e) { console.log("change "+JSON.stringify({val:e.val, added:e.added, removed:e.removed})); })
    .on("select2-opening", function() { console.log("opening"); })
    .on("select2-open", function() { console.log("open"); })
    .on("select2-close", function() { console.log("close"); })
    .on("select2-highlight", function(e) { console.log("highlighted val="+ e.val+" choice="+ JSON.stringify(e.choice));})
    .on("select2-selecting", function(e) { console.log("selecting val="+ e.val+" choice="+ JSON.stringify(e.choice));})
    .on("select2-removing", function(e) { console.log("removing val="+ e.val+" choice="+ JSON.stringify(e.choice));})
    .on("select2-removed", function(e) { console.log("removed val="+ e.val+" choice="+ JSON.stringify(e.choice));})
    .on("select2-loaded", function(e) { console.log("loaded (data property omitted for brevity)");})
    .on("select2-focus", function(e) { console.log("focus");})
    .on("select2-blur", function(e) { console.log("blur");});
```

## Styling

This package provides no styles or assets to your app intentionally.

All of the default select2 styles and assets are included in the `vendor` directory and can be loaded into your application via the following methods:

###### Load files by path
  * Assumes your less / css files are one dir up from your app root

`@import "../packages/jquery-select2/vendor/select2/select2.css";`

###### Symlink the whole library dir

```shell
$ cd public && ln -s ../packages/jquery-select2/vendor/select2 ./
```

## Contributing

* [Report Bugs](https://github.com/LumaPictures/meteor-jquery-select2/issues/new)
* [select2 Wiki](https://github.com/ivaynberg/select2/wiki)
* [select2 forum Announcement](https://groups.google.com/forum/#!topic/select2/C1yc2X7eaGo)
* [Meteor-Talk Announcement](https://groups.google.com/forum/#!topic/meteor-talk/e6whzTDiRE0)