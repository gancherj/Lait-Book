# Complex Data, Part II: User-Defined Types

```lean
import Lait
#lait
```

Aside from `List` and `Option`, Lait also allows you to define your own. 
First, let's consider a type for a binary tree of numbers:
```lean
type Tree := | Leaf (value : Int) | Node (left : Tree) (right : Tree)

def sum_tree (t : Tree) : Int :=
  match t with
  | Leaf x => x
  | Node l r => sum_tree l + sum_tree r
  end

#eval sum_tree (Node (Leaf 10) (Node (Leaf 20) (Leaf 30)))

-- Constructors are functions from their arguments to the type.
#check Leaf
#check Node
```

Here, we are using the `type` keyword, which requires a number of _constructors_. Each constructor 
takes any number of arguments. 
Each constructor can be seen as a function from its fields to the data type. 

If we want to define a tree that can hold values of _any_ type, we can do that by using a type parameter:
```lean
type ParamTree<a> := | PLeaf (value : a) 
                     | PNode (left : ParamTree<a>) (right : ParamTree<a>)
```

Constructor names in Lait must be unique; thus, we used the names `PLeaf` and `PNode`, since `Leaf` and `Node` were taken by `Tree`.
Above, just like polymorphic functions, we use a type parameter `a` to indicate the type of the tree's values.

### Records

Often, one wants to hold a collection of a bunch of values at once. While one could do this with a nested pair:
```lean
type FiveInts := Int * Int * Int * Int * Int

def getFourth (v : FiveInts) := fst (snd (snd (snd v)))
```
this is far from ideal. To handle this in Lait, we use a _record_. A record is simply a datatype with exactly one case:
```lean
type MyRecord := | MkMyRecord (x : Int) 
                              (y : Int) 
                              (z : Int) 
                              (w : Int) 
                              (a : Int)
```
As before, this defines a function `MkMyRecord : Int -> Int -> Int -> Int -> MyRecord`. 
To get out the fourth element, we can then pattern match:
```lean
def getW (m : MyRecord) :=
  match m with
  | MkMyRecord _ _ _ w _ => w
  end
```

However, there is an easier way. 
When we have a record, Lait automatically generates the appropriate _getters_, which behave similarly to the above pattern match:
```lean
#check MyRecord.x
#check MyRecord.y
#check MyRecord.z
#check MyRecord.w
#check MyRecord.a
```
Getters are only defined for data types that have one constructor.
