# `#eval`, `#check`, `Int`, Comments, and Arithmetic Expressions

```lean
import Lait
#lait
```

We begin by using Lait to evaluate and check calculator expressions. 
First, let's see how to use `#eval` to evaluate an expression:

```lean
#eval 1 + 2 -- Evalutes to 3
#eval 1 * 2 -- Evaluates to 2
#eval 1 - 2 -- Evalautes to -1
#eval 1 - (2 - 2) -- Evalautes to 0
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
