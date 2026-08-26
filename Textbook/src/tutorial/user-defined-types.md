# Complex Data, Part II: User-Defined Types

```lean
import Lait
#lait
```

Let's now return to complex data types. Aside from `List` and `Option`, Lait also allows you to define your own. 
First, let's consider a type for a binary tree of numbers:
```lean
type Tree := | Leaf (value : Int) | Node (left : Tree) (right : Tree)

def sum_tree (t : Tree) : Int :=
  match t with
  | Leaf x => x
  | Node l r => sum_tree l + sum_tree r
  end

#eval sum_tree (Node (Leaf 10) (Node (Leaf 20) (Leaf 30)))
```

Here, we are using the `type` keyword, which requires a number of _constructors_. Each constructor 
takes any number of arguments. 

If we want to define a tree that can hold values of _any_ type, we can do that by using a type parameter:
```lean
type ParamTree<a> := | PLeaf (value : a) | PNode (left : ParamTree<a>) (right : ParamTree<a>)
```

Constructor names in Lait must be unique; thus, we used the names `PLeaf` and `PNode`, since `Leaf` and `Node` were taken by `Tree`.
Above, just like polymorphic functions, we use a type parameter `a` to indicate the type of the tree's values.
