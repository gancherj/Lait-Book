# Overview of Lait

```lean
import Lait
#lait
```

Lait, being a functional language similar to ML, has three kinds of syntax:

- **Commands**, such as `#eval` and `def`, for creating top-level definitions and evaluating expressions;
- **Expressions**, such as `2 + 2`, which are computations to be evaluated; and
- **Values**, such as `4`, which are what expressions evaluate to. (Every value is also an expression.)

Additionally, every expression and value has a **type**. 
We will introduce Lait through bite-sized lessons.
