# app-platform-openfaas

This repo shows how to use OpenFaaS templates with App Platform

Since App Platform doesn't know about openfaas templates and faas-cli, we can give it some hints and use the "shrinkwrap" feature of the CLI along with App Platform's Dockerfile build pack.

Get [faas-cli](https://github.com/openfaas/faas-cli):

```bash
faas-cli template store list

faas-cli template store pull golang-middleware

faas-cli new --lang golang-middleware my-function
```

Then hack on your code at `my-function/handler.go` and add a go.mod in the `my-function` folder if you wish.

Next shrinkwrap the function into a build context:

```
faas-cli shrinkwrap -f my-function.yml
```

This creates a build context and Dockerfile at `build/my-function`

Now copy all the contents to the root of the folder:

```
cp -r build/my-function/* ../
```

Do a commit and your function will be built and deployed by AP.

## What next?

It would be nice if DO added support for faas-cli and openfaas templates

We could also copy the build output to a different directory perhaps like `dist` and point AP to do its build from that folder.
