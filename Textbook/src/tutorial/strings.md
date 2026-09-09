# Strings

```lean
import Lait
#lait
```

Values of type `String` are given using double quotes.
Strings support one basic operation: _concatenation_, given by `++`, which puts the two strings together.

```lean
#eval "hello" -- "hello"
#eval "hello" ++ "world" -- "helloworld"
```

We can convert values to a `String` using the `toString` function:

```lean
#eval toString 42
#eval toString true
```
Here, `toString` has a _polymorphic_ type, which means it can accept arguments of multiple types; e.g., `Int`, or `Bool` as above. We will see more about polymorphism [here](./polymorphism.md).
