# Complex Data, Part I: Lists and Option

```lean
import Lait
#lait
```

So far, we have only seen basic data types, such as `Int` and `Bool`, function types, and product types, such as `Int * Int`.
We will now move on more complex data types. 

## Lists
For any type `T`,  `List<T>` is the type of lists of values of type `T`.
To create a list, we have the value `Nil`, which has type `List<T>` for any type `T`; and the function `Cons`, which has type `(a -> (List<a> -> List<a>))`; that is, it takes in a value of type `a` and a list of type `List<a>` and returns a list of type `List<a>`.

```lean
#check Nil
#check Cons
#eval Cons 1 (Cons 2 (Cons 3 Nil)) 
```


### Using Lists

To use a list, we _pattern match_ on it.
```lean
def sumList (xs : List<Int>) : Int  := 
  match xs with
  | Nil => 0
  | Cons h t => h + sumList t
  end

#eval sumList [1, 2, 3]
```
Every patern match must begin with `match e with`, where `e` is an expression; and must end with `end`.
For lists, pattern matching must analyze two cases: the `Nil` case, and the `Cons` case.
If we forget one of the two cases, Lait will throw an error:
```lean
def badSumList (xs : List<Int>) : Int  := 
  match xs with
  | Cons h t => h + badSumList t
  end
```

### Abbreviations for Lists

Since lists are so common, we also have abbreviations. 
First, `Nil` and `Cons` are synonymous with `[]` and `::`.
This can be used both for creating lists and pattern matching on lists.
```lean
#eval 1 :: 2 :: 3 :: [] 

def sumList2 xs := 
  match xs with
  | [] => 0
  | h :: t => h + sumList2 t
  end
```


In addition, when making a particular list, we can use the syntax `[e1, e2, ..., en]`, where `e1`, `e2`, ..., `en` are expressions of type `t`:
```lean
#eval [1, 2, 3] 
```
Here, `[1, 2, 3]` is exactly equivalent to `1 :: 2 :: 3 :: []`, which is in turn exactly equivalent to `Cons(1, Cons(2, Cons(3, Nil)))`.

### Common List Operations

Lait has a number of list operations built in to its standard library.
We give a few examples here; more can be seen in the [standard library reference](../stdlib.md).

`List.append : List<a> -> List<a> -> List<a>` takes two lists and returns a new list that joins them together:
```lean
#eval List.append [1, 2, 3] [4, 5, 6] 
```
Identifiers in Lait can [have periods in the middle of them](./arithmetic.md). We use 
this as a simple form of _namespacing_: `List.append` is the name we give to an operation on lists (as opposed to an `append` operation on, say, strings). 

`List.length : List<a> -> Int` takes a list and returns its length:
```lean
#eval List.length [1, 2, 3]
```

`List.member : List<a> -> a -> Bool` takes a list and a value and returns `true` if the value is in the list, and `false` otherwise:
```lean
#eval List.member [1, 2, 3] 2
#eval List.member [1, 2, 3] 4 
```
Note that `List.member` only works for lists of types that can be compared for equality (e.g., `Int`), and will throw an error if the list contains functions.

`List.filter : List<a> -> (a -> Bool) -> List<a>` takes a list and a predicate and returns a new list that contains only the elements of the original list that satisfy the predicate:
```lean
#eval List.filter [1, 2, 3] (fun x => x >= 2) 
```

`List.find : List<a> -> (a -> Bool) -> Option<a>` takes a list and a predicate and returns the first element of the list that satisfies the predicate, or `None` if no element satisfies the predicate:
```lean
#eval List.find [1, 2, 3] (fun x => x >= 2) 
#eval List.find [1, 2, 3] (fun x => x > 3)
```
(Option types are discussed below.)


## Options

Lists are one example of user-defined _data type_, which is built up out of _constructors_ (e.g., `Nil` and `Cons` for lists).
Another common example built into Lait are _option_ types. 
Given a type `t`, a value of type `Option<t>` is either `None` or `Some x`, where `x` is a value of type `t`.
Hence, an option type is used when a value may or may not be present.

```lean
#check None  
#check Some 1
```

To use an option type, we pattern match on it, similar to lists. Below is a worked example:
```lean
def List.getFirst (xs : List<a>) : Option<a> :=
  match xs with 
  | [] => None
  | x :: _ => Some x
  end

def List.isFirstPositive (xs : List<Int>) : Bool :=
  match List.getFirst xs with 
  | None => false -- List is empty, so head is not positive
  | Some x => x > 0 -- Otherwise, return whether that first element is positive
  end
```
First, we create a function `List.getFirst` that gets the first element of a list, or `None` if the list is empty.
Then, we create a function `List.isFirstPositive` that uses `List.getFirst` to get the first element if it exists; if it does, we return whether it is greater than zero.
