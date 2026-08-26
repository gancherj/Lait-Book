# Boolean Operators

```lean
import Lait
#lait
```

The `Bool` type is defined by the values `true` and `false`. 

## Logical Operators 

We use the infix operators `&&`, `||`, and the prefix operator `not` to build expressions of type `Bool`:

```lean
#eval true || false
#eval false && true
#eval not false
#eval not (true && not false)
```

## Comparison Operators

We can also create expressions of type `Bool` by using equality, `==`:
```lean
#eval (1 == 2)
#eval (false == false)
#eval ("hello" == "hello")
```

Given two expressions `e1` and `e2` of the same type, we can form `e1 == e2`, which has type `Bool`. (Note that equality doesn't work for 
all types; e.g., function types, which we will see later.)
We also have the shorthand `e1 != e2` for `not (e1 == e2)`:
```lean
#eval (1 != 2)
#eval (false != false)
#eval ("hello" != "hello")
```

The ordinary comparison operators on `Int` are `<`, `>`, `<=`, and `>=`:
```lean
#eval (1 < 2)
#eval (3 >= 3)
#eval (4 <= 2)
#eval (7 > (-2))
```

## If/then/else

To _use_ a `Bool`, the primary way is to use it in an `if/then/else` expression:
```lean
#eval (if false then 1 else 2)
```
Given a boolean expression `e`, and two other expressions `e1/e2` of the same type `T`, `if e then e1 else e2` has type `T`.
