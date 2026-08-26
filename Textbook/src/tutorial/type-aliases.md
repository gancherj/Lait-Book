# Type Aliases

```lean
import Lait
#lait
```

We can create type aliases with the following syntax:
```lean
type Foo := Int * Int

def getFirst (f : Foo) := fst f
```

Type aliases can be parameterized as well:
```lean
type Pair<a, b> := a * b
def Pair.fst (p : Pair<a, b>) : a := fst p
```
