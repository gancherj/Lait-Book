# Complex Data, Part III: Records

```lean
import Lait
#lait
```

While one can use pairs to hold many values (e.g., by holding a value of type `Int * (Int * Int)` and so on), doing so is not very ergonomic.
To handle this use case, Lait supports _records_, which are tuples of at least one element where each element is named. 

```lean
type MyFiveInts := {
  x : Int,
  y : Int,
  z : Int,
  w : Int,
  a : Int
}

type MyFiveThings<a> := {
  x : a,
  y : a,
  z : a,
  w : a,
  a : a
}
```
