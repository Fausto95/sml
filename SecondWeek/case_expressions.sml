datatype my_own_type = TwoInts of int * int
  | Str of string
  | Pizza

(* my_own_type -> int*)
fun f (x: my_own_type) =
  case x of
    Pizza => 3
  | TwoInts(i1, i2) => i1 + i2
  | Str s => 8

(*
  f
  f(Str "hi")
*)


