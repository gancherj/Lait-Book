# Polymorphism

```lean
import Lait
#lait
```

Often, we will be able to write a function that can apply to multiple types. For example, consider the identity function `fun x => x`: we can supply an `Int` to receive an `Int`, and similarly for a `String`. We can see this in action in Lait below:

```lean
def id x := x
#check id
```

The "type" of `id` is `∀ a. a -> a`, which means that we can supply a value of _any_ type `a`, and receive a value of type `a`.
(We write "type" in quotes because forall-types can only be associated to top-level definitions, and not arguments of functions.) 
Let's see what happens when we supply various arguments to `id`:

```lean
#eval id 42 -- 42
#eval id "hello" -- "hello"
```

A more complicated example of polymorphism is given by a higher-order function that applies a given function twice:
```lean
def applyTwice f x := f (f x)
#check applyTwice
```

## Polymorphism and Type Annotations

We can use type annotations with polymorphic functions. 
While all types in Lait begin with a capital letter, we have that type _variables_ --- that is, variables that represent types --- begin with a lowercase letter.

```lean
def applyThrice (f : a -> a) (x : a) : a := f (f (f x))
#check applyThrice
```

Above, the variable `a` stands in for an arbitrary type.
Note that while `applyThrice` has the type `∀ a. (a -> a) -> a -> a`, we assign `f` the type `a -> a` in the arguments of `applyThrice`;
the "forall" symbol `∀` cannot appear in type annotations to arguments.

## Examples: Equality and toString

Two important polymorphic definitions in Lait are equality and `toString`, which we have already seen.
Let's now look at them more closely:

```lean
def eq x y := x == y
def tostr x := toString x
#check eq
#check tostr
```

As we see above, `eq` has type `∀ a. a -> a -> Bool`, while `tostr` has type `∀ a. a -> String`.
While this usually works as expected, an important exception is what happens 
when `a` is a function type, such as `Int -> Int`:
```lean
#eval (fun (x : Int) => x) == (fun (y : Int) => y)
#eval toString (fun (x : Int) => x)
```
