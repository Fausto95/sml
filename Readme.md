# These are my personal notes that I'm taking while learning Standard ML


### Variables Bindings

```sml
val a = 2;
```

Syntax:
  - Keyword <b>val</b> and punctuation <b>=</b> and <b>;</b>
  - Variable <b>a</b>
  - Expression e
    - Many forms of these, most containing subexpressions

- Syntax is just how you write something

- Semantics is what that something means
  - Type-checking(before program runs)
  - Evaluation(as program runs)

- For variable bindings:
  - Type-check expression and extends static environment
  - Evaluate expression and extend dynamic environment

---------


### Conditional Expressions

```sml
  if y = 0
  then 1
  else x
```

Syntax:
  if e1 then e2 else e3
  where if, then, and else are keywords and e1, e2 and e3 are subexpressions

Type-checking:
  first e1 must have type bool
  e2 and e3 can have any typee (let's call it t), but they
  must have the same type t
  the type of the entire expression is also t

---------

### Functions

Functions are created using the keyword `fun`

```sml
fun pow(x: int, y: int) =
  if y = 0
  then 1
  else x * pow(x, y - 1)
```

```sml
pow(2, 3);
```
Unless a function has one argument, we need to use parentheses to call it

---------

### Tuples


Tuples are created using parenthesis `(24, "Faustino")`

```sml
val tuples = (24, "Faustino");
```

Accessing tuple elements

```sml
fun swap(pr: int * bool ) =
  (#2 pr, #1 pr)
```
```sml
swap(2, true)
```

---------

### Lists

Lists are declared using brackers `[]`. Lists elements must have the same type


```sml
val list = [2, 3, 4];
```


---------


### Let Expressions(Scope)

 - Syntax

```sml
let b1 b2 ... bn in e end
```

Each <b>bi</b> is any binding and <b>e</b> is any expression(body)

```sml
fun silly1(z: int) =
  let
    val x = if z > 0 then z else 34
    val y = x + z + 9
  in
    if x > y then x * 2 else y * y
  end
```

---------

### Nested Functions

```sml
fun countup_from1_3(x: int) =
  let
    fun count(from: int) =
      if from = x
      then x::[]
      else from :: count(from + 1)
  in
    count(1)
  end
```

---------

### Options

 - t option is a type for any type t
  - (much like t list, but different type, not a list)

Building:
  - NONE has type 'a(alpha) option (much like [] has type 'a list)
  - SOME e has type t option if e has type t (much like e::[])

Accessing:
  - isSome has type 'a option -> bool
  - valOf has type 'a option -> 'a (exception if given NONE)


---------

### Boolean Operations

e1 `andalso` e2
e1 `orelse` e2

`not` e1

Equivalents



```sml
(* el andalso e2 *)
if e1
then 2
else false
```

```sml
(* el orelse e2 *)
if e1
then true
else e2
```

```sml
(* not e1 *)
if e1
then false
else true
```

---------

### Comparisons

- Equality `=`
- Not Equal `<>`
- Greater than `>`
- Less than `<`
- Greater than or equal `>=`
- Less than or equal `<=`

> '>' < >= <= can be used with real(float), but not 1 int and 1 real(float)

> = <> can be used with any "equality type" but not with real(float)

