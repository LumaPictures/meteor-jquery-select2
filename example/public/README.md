# Static

These are the default static assets used by this module and its included `less` files.

To include these assets in your application you must create a symlink into you `public` folder like so :

```shell
$ cd public && ln -s ../packages/luma-ui/static ./
```

All of these assets will then be served statically by your application at `http://<host>/static/`