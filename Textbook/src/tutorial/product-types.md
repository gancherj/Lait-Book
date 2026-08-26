# Product Types

```lean
import Lait
#lait
```

We can put types together to form _product types_, with syntax `S * T`, where `S` and `T` are types. A value of type `S * T` is a pair of a value of type `S` and a value of type `T`.

We create values of product types using tuples:
```lean
#eval (3, "hello") -- (3, "hello")
```

Given a product type, we can project out the first or second component as follows:
```lean
#eval fst (2, 3) -- 2
#eval snd (2, 3) -- 3
```
