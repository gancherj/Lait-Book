# Functions

```lean
import Lait
#lait
```

Being a functional language, Lait treats functions as ordinary data, just like the types `Int` or `String`. 
For any types `S` and `T`, the type of a function from `S` to `T` is written `S -> T`.

## Anonymous Functions

To create a function in Lait, one way is to define an _anonymous function_ using the syntax `fun x => e`. 
We can also write type annotations for the argument through the syntax `fun (x : T) => e`, where `T` is the type of the argument.
We can call a function in Lait by putting the function and argument side by side.

```lean
-- Creating anonymous functions:
#check fun x => x + 1 
#eval fun x => x + 1 
#check fun (x : Bool) => not x

-- Calling an anonymous function:
#eval (fun x => x + 1) 42

-- Assigning an anonymous function to a def:
def myFunc : Int -> Int := fun x => x + 1

-- Calling it:
#eval myFunc 20
```

## Named Functions

Another way to define functions in Lait is by using _named functions_, which we create by using `def` with arguments.

```lean
def myFunc' x := x + 1
def myFunc'' (x : Int) := x + 1

#eval myFunc' 12
#eval myFunc'' 12
```

### Multi-Argument Functions

In contrast to anonymous functions, named functions can take in multiple arguments. 
```lean
def addThese (x : Int) y (z : Int) : Int := x + y + z

-- The function itself has a nested function type.
-- We can think of this as either a function of three arguments, 
-- or equivalently a function that returns a function, which itself
-- returns another function. 
#check addThese

-- We can partially apply functions of multiple arguments.
#check addThese 1
#check addThese 1 2
#eval addThese 1 2 3
```

As seen above, multi-argument functions have a nested function type; for example, `addThese` will have type `Int -> (Int -> (Int -> Int))`. 
We can _partially apply_ an argument to `addThese` to obtain a new function with one less argument.

### Recursion

Functions with names can be used recursively:
```lean
def factorial (n : Int) : Int := 
  if n <= 0 then 1 else 
  n * factorial (n - 1)

#eval factorial 5
```
