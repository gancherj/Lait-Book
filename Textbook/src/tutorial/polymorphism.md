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

The type of `id` is `a -> a`. Here, `a` is a _type variable_, which can be instantiated to any other type.
While types in Lait must begin with a captial letter, type variables must begin with a lowercase one.
Hence, we can think of `id` as having type `Int -> Int`, if we set `a = Int`, or `String -> String`, if `a = String`. 
Let's see what happens when we supply various arguments to `id`:

```lean
#eval id 42 
#eval id "hello" 
```

### Some Examples

Let's see a few more examples of polymorphism. First, let's see this one:
```lean
def doSomeStuff f x := f x
#check doSomeStuff
```
Here, `doSomeStuff` has type `(a -> b) -> a -> b`.
That is, we can call `doSomeStuff` on any values `f` and `x`, as long as `f` is a function and `x`'s type is the same as the input type to `f`. 

If we didn't call `f` on `x` then we would get a less constrained type:
```lean
def doOtherStuff f x := x
#check doOtherStuff
```
Here, `f` has type `a`, while `x` has type `b`. Thus `f` and `x` can be _anything_, and they don't have to have types that are related to each other. 

Let's look at one final example:
```lean
def applyTwice f x := f (f x)
#check applyTwice
```

Here we see that the type of `applyTwice` is `(a -> a) -> a -> a`. 
This type is even more specialized than `doSomeStuff`: not only does `x` need to be the input to `f`, but the output of `f` must also be a valid input to `f` (since we call `f` on `f x`). 

## Polymorphism and Type Annotations

We can use type annotations with polymorphic functions. 
```lean
def applyThrice (f : a -> a) (x : a) : a := f (f (f x))
#check applyThrice
```

## Equality and toString

Two important polymorphic definitions in Lait are equality and `toString`, which we have already seen.
Let's now look at them more closely:

```lean
def eq x y := x == y
#check eq
#check toString
```

As we see above, `eq` has type `a -> a -> Bool`, while `toString` has type `a -> String`.

An important quirk of equality is that, while Lait allows us to compare any type for equality,
some types (most importantly function types) do not work:
```lean
-- This throws an error, because are comparing functions for equality.
#eval (fun (x : Int) => x) == (fun (y : Int) => y)
```
