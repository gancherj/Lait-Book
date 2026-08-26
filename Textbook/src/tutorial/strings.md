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

We can convert an `Int` to a `String` using the `toString` function:

```lean
#eval toString 42 -- "42"
```
