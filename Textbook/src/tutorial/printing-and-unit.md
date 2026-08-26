# Printing and the Unit type

```lean
import Lait
#lait
```

Expressions in Lait can do more than compute values; they can also _do things_ via side effectful operations, such as printing.
To print things in Lait, we use the function `print : String -> Unit`. Here, `Unit` is a type in Lait that has exactly one value --- written `()` --- 
which is used to represent the absence of a particular return value. Let's see it in action:

```lean
#eval print "hello"
```

When we sequence computations together using `let`, the side effects happen in order:
```lean
#eval let _ := print "hello" in print "world"
```

(We use underscores in `let` to indicate that we don't care about the value of the expression, since we know it will return `()`.)
(TODO: double check how the hover should appear.)

Note that `def`s that contain side effects (such as `print`) are evaluated as soon as they are defined:
```lean
def myPrint := print "hello"
```

If we want to delay `myPrint` to only happen when we want it to, we want to make it a function. For this purpose, we can pass it a value of type `Unit`:
```lean
def myPrint' (u : Unit) := print "hello"
#eval myPrint' ()
```
Since we never care about the value of `u`, we have special syntax for arguments of type `Unit`:
```lean
def myPrint'' () := print "hello"

#eval myPrint'' ()
#eval myPrint'' ()
```
