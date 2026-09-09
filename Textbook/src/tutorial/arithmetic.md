# Arithmetic and Basic Commands: `#eval/check/test`

```lean
import Lait
#lait
```

Lait is a typed functional language similar to ML. Hence, if you have used
Haskell, OCaml, SML, or [Plait](https://docs.racket-lang.org/plait/index.html)
before, the concepts here should be familiar. 
We begin by using Lait to evaluate and check calculator expressions. 
First, let's see how to use `#eval` to evaluate an expression:

```lean
-- Below are some arithmetic expressions.

/-
And here
is another comment.
-/

#eval 1 + 2 
#eval 1 * 2 
#eval 1 - 2 
#eval 1 - (2 - 2) 
```

By hovering over the above expressions (e.g., `1 * 2`), we can see that they all have type `Int`, which stands for integers.
Values of type `Int` are given by numeric constants; i.e., `3`, or `-4`. 
The name of every type in Lait begins with a capital letter.

## Comments
Single-line comments in Lait, inherited from Lean, start with `--`. 
Multi-line comments begin with `/-` and end with `-/`.

## Command: `#check`
We can also simply _type check_ expressions without running them by using `#check`:
```lean
#check 2 + 3
```
## Command: `#test`

You can write unit tests in Lait as follows:
```lean
#test (1 + 2 * 3) === 7
```
The syntax is `#test e1 === e2`, where `e1` and `e2` are expressions. Note the use of **three** equals signs.
If a test passes, nothing happens; however, if a test fails, we see an error message:
```lean
#test 1 * 2 === 3
```
In this book (as well as when using Lait), error messages show up as red squiggles.

