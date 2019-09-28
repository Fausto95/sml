val x = {
  bar = (1 + 2, true andalso true) ,
  foo = 3 + 4,
  baz = (false, 9)
}

val me = {age=24, name="Faustino"} : {age: int, name: string}


val a_pair = (5 + 5, 3 + 3)

val a_record = {second = 2 + 2, first = 2 + 1} (* first:int, second: int *)
val b_pair = {2 = 5, 1 = 6} (* (int * int) *) (* (6, 5) *)

#1 a_pair + 2 b_pair (* 9: int *)

val x = {3 = "hi", 1 = true, 2 = 3 + 2} (* (true, 5, "hi") *)

