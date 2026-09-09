# Errors

```lean
import Lait
-- This command below is just used to fix some printing of errors. 
-- You don't need to use this in your own code. 
#no_file 
#lait
```

In Lait, you can raise an error at runtime as follows:

```lean
def throw () := error "Hello"

#eval throw ()
```

You can use this to create algorithms which are partial. For example:
```lean
def List.unsafe_head (xs : List<a>) : a :=
 match xs with 
 | Nil => error "List is empty"
 | Cons x _ => x
 end

#eval List.unsafe_head [1, 2, 3]

#eval List.unsafe_head []
```

## Special syntax: `...`

In Lait, `...` (three dots in a row) is synonymous with `error "unimplemented"`:

```lean
def fill_this_in () : Int := ...

#eval fill_this_in ()
```

