# Lait Standard Library 

This file documents the functions and types that are included with Lait. 
See the [tutorial](./tutorial.md) for documentation about the basic types of Lait, including `Int`, `Bool`, `String`, function types, `Unit`, and product types. 

### Lists

Lists are defined as the following data type:

```
type List<a> := | Nil | Cons (h : a) (t : List<a>)
```

The following functions are already included with Lait:

- `List.append : List<a> -> List<a> -> List<a>`. Append the two lists.
- `List.length : List<a> -> Int`. 
- `List.member : List<a> -> a -> Bool`. Return `true` only if the second argument is in the list. Calls equality, so will fail if the list is holding functions.
- `List.filter : List<a> -> (a -> Bool) -> List<a>`. Filter out members of the list for which the predicate does not hold. The predicate is ran in order on all elements of the list.
- `List.find : List<a> -> (a -> Bool) -> Option<a>`. Find the first element of the list for which the predicate holds.
- `List.map : List<a> -> (a -> b) -> List<b>`. Run the function in order on all elements in the list, and return the new list.


### Option

The `Option` type is defined as follows:
```
type Option<a> := | None | Some (x : a)
```

It has the following functions included:
- `Option.andThen : Option<a> -> (a -> Option<b>) -> Option<b>`. If the first argument is `None`, do nothing; otherwise, the argument is `Some x`; run the function on `x` and return the result. 

### Maps

If you want to use a key-value map, use the following datatype:
```
type Map<k,v> := ...
```
(We elide the internal details of `Map` here, since you should just use it via its functions below.)
Here, the first type parameter `k` is the type of _keys_, and the second parameter `v` is the type of _values_.
You can use the following operations on maps:

- `Map.empty`, which has type `Map<k,v>` for any `k` and `v`. This is the empty map.
- `Map.delete : Map<k,v> -> k -> Map<k,v>`. Delete the key from the map.
- `Map.insert : Map<k,v> -> k -> v -> Map<k,v>`. Add the given key-value pair to the map.
- `Map.lookup : Map<k,v> -> k -> Option<v>`. 

### Mutable References

We have the following functions available for mutable references:

- `alloc : a -> Ref<a>`. Create a new memory cell and fill it with its contents.
- `get : Ref<a> -> a`. Read the memory cell.
- `set : Ref<a> -> a -> Unit`. Write to the memory cell. 

## Other functions

- `toString : a -> String`. Render the value as a string.
- `print : String -> Unit`. Print the string as output.


