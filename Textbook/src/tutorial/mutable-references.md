# Mutable References

```lean
import Lait
#lait
```

The final major feature of Lait is _mutation_, expressed similar to `ref` in OCaml, or a `box` in Racket. 
For any type `T`, `Ref<T>` is the type of a mutable reference to a `T`; that is, a "box" that holds a `T`, and can be updated.
Let's see a worked example below:
```lean
def mkBox () : Ref<Int> := alloc 0

def incr (x : Ref<Int>) : Unit := 
  let v := get x in 
  set x (v + 1)

def myInt := mkBox ()

#eval get myInt
#eval incr myInt
#eval incr myInt
#eval get myInt
#eval incr myInt
#eval get myInt
```

We now detail the language features related to mutation.

- To create a reference, one uses the function `alloc : a -> Ref<a>`. 
- To read the current value of a reference, one uses the function `get : 
    Ref<a> -> a`.
- To update the value of a reference, one uses the function `set : a ->
    Ref<a> -> Unit`.
- All commands in Lait are evaluated top to bottom. Hence, the first `#eval` returns `0`, since we haven't incremented the value yet. 

As a more sophisticated example, let's increment a list using mutation:
```lean
-- `List.iter f xs` runs `f` on each element of `xs` in order.
def List.iter (f : a -> Unit) (xs : List<a>) : Unit := 
  match xs with 
  | [] => ()
  | x :: xs' => let _ := f x in List.iter f xs'
  end

-- Imperative sum over a list.
def List.sum (xs : List<Int>) : Int := 
  -- First, allocate a reference holding 0.
  let sum : Ref<Int> := alloc 0 in
  -- Iterate over the list: when we see an element `x`, 
  -- set `sum` to be the `x` plus the current value of `sum`.
  let _ := List.iter (fun x => set sum (get sum + x)) xs in 
  -- Return the value of `sum` after the iteration.
  get sum

#eval List.sum [1, 2, 3, 4, 5]
```
