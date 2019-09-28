# These are my personal notes that I'm taking while learning Standard ML


### REPL
https://www.smlnj.org/doc/interact.html

#### launching the repl

```bash
sml
```
To use a file in the repl, simply:

```
use "filename.sml";
```

----

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
val tuples = (24, "Faustino")
```

Accessing tuple elements

```sml
#2 tuples;
```

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
val list = [2, 3, 4]
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


---------

### 2nd Week

### Building bigger types

Base types are:

- int
- bool
- unit
- char

Ways to build compound types: tuples, lists, options.


3 most important type building-blocks in any language

- "Each of": A `t` value contains values of each of `t1` `t2` .. `tn`
- "One of": A `t` value contains values of one of `t1` `t2` .. `tn`
- "Self reference": A `t` value can refer to other `t` values

Compound types, are ways that you build new types with other types inside of them.

----

Which of the following concepts would be appropriate to represent using just an "each of" type?
- [x] The position of an object in 3-space
  > The position of an object can easily be represented by each of an x, y, and z coordinates. Likewise, the first and last names of a person can be easily represented as each of the first and last names. However, the status of a printer is either printing, or ready, or jammed, or on fire, etc, which doesn't fit well into an each of type. Finally, the length of a list is just simply a count, and doesn't need an each of type.
- [ ] Isso deve ser selecionado

- [ ] The status of a printer (printing, ready, jammed, on fire, etc...)

- [ ] Não selecionado está correto

- [ ] The length of a list

- [ ] ão selecionado está correto

- [x] The first and last names of a person
  > The position of an object can easily be represented by each of an x, y, and z coordinates. Likewise, the first and last names of a person can be easily represented as each of the first and last names. However, the status of a printer is either printing, or ready, or jammed, or on fire, etc, which doesn't fit well into an each of type. Finally, the length of a list is just simply a count, and doesn't need an each of type.

----

Which of the following concepts would be appropriate to represent using just a "one of" type?

- [ ] The particular flavor of ice cream in a bowl (assuming, of course, that bowls only hold one flavor of ice cream)
  >A bowl of ice cream has one of the many possible flavors. Likewise, the current weather is one of many possible values. However, the set of students that showed up to class is not easily represented by a "one of" type, and the current rabbit population needs nothing more than a simple count for representation.


- [ ] The set of students who actually showed up to class today
- [x] The current weather (sunny, partly cloudy, rainy, hurricane, etc...)
  > A bowl of ice cream has one of the many possible flavors. Likewise, the current weather is one of many possible values. However, the set of students that showed up to class is not easily represented by a "one of" type, and the current rabbit population needs nothing more than a simple count for representation.

- [ ] The current rabbit population in a park



----

Examples

  * Tuples build each-of types
    - `int` * `bool` contains an `int` and a `bool`
  * Options build one-of types
    - `int option` contains an `int` or it contains no data
  * Lists use all three building blocks
    - `int list` contains an `int` and another `int list` or it contains no data
  * And of course we can nest compound types
    - `((int * int) option * (int list list)) option`

----


Another way to build each-of types in ML:
  - Recods: have named fields and indexes
  - Connection to tuples and idea of syntactic sugar


### Records

```sml
val x = {
  bar = (1 + 2, true andalso true) ,
  foo = 3 + 4,
  baz = (false, 9)
}

val me = {age=24, name="Faustino"} : {age: int, name: string}

(* Accessing records elements *)
#name me
```
Tuples as Syntactic Sugar

```sml
val me = {age=24, name="Faustino"} : {age: int, name: string}

val a_pair = (5 + 5, 3 + 3)

val a_record = {second = 2 + 2, first = 2 + 1} (* first:int, second: int *)
val b_pair = {2 = 5, 1 = 6} (* (int * int) *) (* (6, 5) *)

#1 a_pair + 2 b_pair (* 9: int *)

val x = {3 = "hi", 1 = true, 2 = 3 + 2} (* (true, 5, "hi") *)

```

----


### Data Types Bindings

Tag: Constructor
Data: the corresponding data part

```sml
datatype my_own_type = TwoInts of int * int
  | Str of string
  | Pizza

val a = Str "hi"
val b = Str
val c = Pizza
val d = TwoInts(2 + 1, 3)
val e = a
```

### Case Expressions

Concept to access made up from the types we introduced with data type bindings

Example:

```sml
fun f x = (* f has type my_own_type -> int*)
  case x of
    Pizza => 3
  | TwoInts(i1, i2) => i1 + i2
  | Str s => String.size s
```


#### Expression Trees

```sml
datatype exp = Constant of int
  | Negate of exp
  | Add of exp * exp
  | Multiply exp * exp
```

An expression in ML of type:
`Add (Constant (10 + 9), Negate (Constant 4)`

Picturing the resulting value:

```
            Add
    Constant    Negate
      19       Constant
                  4
```


### Pattern Matching

```sml
fun max_constant3 e =
  let fun max_of_two(e1, e2) = Int.max(max_constant3 e1, max_constant3 e2)
  in
  case e of
    Constant i => i
  | Negate e2 => max_constant3 e2
  | Add(e1, e2) => max_of_two(e1, e2)
  | Multiply(e1, e2) => max_of_two(e1, e2)
  end
```


### Recursive Datatypes

```sml
(* Options *)

fun inc_or_zero intoption =
  case intoption of
    NONE => 0
    | SOME i => i + 1
```

