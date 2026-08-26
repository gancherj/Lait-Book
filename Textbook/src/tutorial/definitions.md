# Creating Simple Definitions

```lean
import Lait
#lait
```

Lait has two constructs to create definitions, depending on if you are at the top level writing a command, or inside an expression.

At the top level, we use `def`, which can be written with or without a type annotation after the name of the definition: 
```lean
def foo := 32
def foo_plus_one : Int := foo + 1
#eval foo_plus_one - 1
```

Inside expressions, we use `let .. := .. in ..`, which similarly can have optional type annotations.
```lean
#eval  let x : Int := 3 in  let y := x * 2 in y * 3
#eval let res := (let b : Bool := false in if b then 1 else 2) in res * 2
```
