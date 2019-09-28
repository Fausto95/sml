(* Lists *)
datatype my_int_list = Empty
  | Cons of int * my_int_list

val x = Cons(6, Cons(9, Cons(1995, Empty)))

fun append_my_list (xs, ys) =
  case xs of
  Empty => ys
  | Cons(x, xsx) => Cons(x, append_my_list(xsx, ys))

(* ------------------------------ *)

(* Options *)

fun inc_or_zero intoption =
  case intoption of
    NONE => 0
    | SOME i => i + 1

(* ------------------------------ *)


(* Lists *)
fun sum_list xs =
  case xs of
  [] => 0
  | x::xsx => x + sum_list xsx

fun append (xs, ys) =
  case xs of
    [] => ys
    | x::xsx => x :: append(xsx, ys)

