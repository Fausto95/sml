datatype my_own_type = TwoInts of int * int
  | Str of string
  | Pizza

val a = Str "hi"
val b = Str
val c = Pizza
val d = TwoInts(2 + 1, 3)
val e = a


datatype suit = Club | Diamond | Heart | Spade
datatype rank = Jack | Queen | King | Ace | Num of int

datatype id = StudentNum of int | Name of string * (string option) * string


datatype exp = Constant of int
  | Negate of exp
  | Add of exp + exp
  | Multiply exp * exp

(*
  Recursion
    Functions over recursive datatypes are usually recursive
*)

fun eval e =
  case e of
  Constant i => i
  | Negate e2 => ~(eval e2)
  | Add(e1, e2) => (eval e1) + (eval e2)
  | Multiply(e1, e2) => (eval e1) * (eval e2)

