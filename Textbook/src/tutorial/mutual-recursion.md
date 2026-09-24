# Mutually Recursive Functions

```lean
import Lait
#lait
```

Normally, a definition in Lait can only refer to itself and to definitions that come _before_ it.
Sometimes, though, two (or more) functions need to call each other.
To do this, we link the definitions together with the `and` keyword:
```lean
def isEven (n : Int) : Bool :=
  if n == 0 then true else isOdd (n - 1)
and isOdd (n : Int) : Bool :=
  if n == 0 then false else isEven (n - 1)

#eval isEven 10
#eval isOdd 7
```

Each clause after the first begins with `and` instead of `def`, and otherwise looks just like a named function.
Every function in the group can call every other function in the group.
Each function in a mutually recursive group must take at least one argument.

## Mutually Recursive Types

Types can be mutually recursive too, using the same `and` syntax.
Below, a `Tree` holds either a single value or a `Forest` of subtrees, and a `Forest` is a list of `Tree`s:
```lean
type Tree<a> := | Leaf (v : a) | Node (c : Forest<a>)
and Forest<a> := | FNil | FCons (t : Tree<a>) (f : Forest<a>)

def treeSize (t : Tree<a>) : Int :=
  match t with
  | Leaf v => 1
  | Node c => forestSize c
  end
and forestSize (f : Forest<a>) : Int :=
  match f with
  | FNil => 0
  | FCons t f' => treeSize t + forestSize f'
  end

#eval treeSize (Node (FCons (Leaf 1) (FCons (Leaf 2) FNil)))
```
