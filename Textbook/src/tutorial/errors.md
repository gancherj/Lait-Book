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

## Testing for errors

In Lait, you can write tests for the presence of an error. If you have an expression `e` that should error, you can write `#test_error e` ensure that `e` will error.
```lean
def only_return_nonneg (i : Int) : Int :=
  if i < 0 then error "Bad input!" else i

#test only_return_nonneg 32 === 32
#test_error only_return_nonneg (- 5)
#test_error only_return_nonneg 32
```

Additionally, `#test_error` has a form where you can also assert the exact error you expect:
```lean
#test_error only_return_nonneg (-5) ~ "Bad input!"
#test_error only_return_nonneg (-5) ~ "some other error"
```
