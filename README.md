## Event Storming with Purescript

The goal is to implement a simple kanban board, with three column (Todo, Doing, Done) and being able to move cards around.

This is an introduction to functional languages and domain design. Have fun!

## Easy install with node & npm

You need those global dependencies:

```
npm install -g purescript
npm install -g pulp
npm install -g psc-package
```

Then you can use `psc-package` to install purescript dependencies and `pulp` as a build system

```
psc-package install
pulp build
pulp test
```

