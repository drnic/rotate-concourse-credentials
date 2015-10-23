Rotate Concourse credentials
============================

Soooo, a friend of yours - not you - accidentally commits your AWS/Docker/Github credentials into a public repository and now you need to cancel all your credentials and update all your pipelines as soon as possible.

You empathise. You'd never do this. But you understand it can happen.

Here are two scripts that can help. Your friend, that is. Not you. You didn't do anything.

```
./fetch_pipelines.sh <target concourse>
```

This will download every pipeline you have access to into `tmp`.

You can then edit all the files to change credentials.

You can then interactively update the pipelines:

```
./push_pipelines.sh <target concourse>
```
