datatype exp = Constant of int
  | Negate of exp
  | Add of exp * exp
  | Multiply of exp * exp


fun max_constant e = case e of
    Constant i => i
  | Negate e2 => max_constant e2
  | Add(e1, e2) => if max_constant e1 > max_constant e2
    then max_constant e1
    else max_constant e2
  | Multiply(e1, e2) => if max_constant e1 > max_constant e2
    then max_constant e1
    else max_constant e2

fun max_constant2 e = case e of
    Constant i => i
  | Negate e2 => max_constant2 e2
  | Add(e1, e2) =>
    let val m1 = max_constant2 e1
      val m2 = max_constant2 e2
    in if m1 > m2 then m1 else m2 end
  | Multiply(e1, e2) =>
    let val m1 = max_constant2 e1
      val m2 = max_constant2 e2
    in if m1 > m2 then m1 else m2 end

fun max_constant3 e =
  let fun max_of_two(e1, e2) = Int.max(max_constant3 e1, max_constant3 e2)
  in
  case e of
    Constant i => i
  | Negate e2 => max_constant3 e2
  | Add(e1, e2) => max_of_two(e1, e2)
  | Multiply(e1, e2) => max_of_two(e1, e2)
  end


val test_exp = Add(Constant 19, Negate(Constant 4))
val nineteen = max_constant3 test_exp






(* Pattern matching in tuples and records (each-of) *)
fun sum_triple triple =
  case triple of
  (x, y, z) => x + y + z

fun full_name r =
  case r of
    {first=x, middle=y, last=z} => x ^ " " ^ y ^ " " ^ z

fun sum_triple2 triple =
  let val (x, y, z) = triple
  in
    x + y + z
  end

fun full_name2 r =
  let val {first=x, middle=y, last=z} = r
  in
    x ^ " " ^ y ^ " " ^ z
  end

fun sum_triple3 (x, y, z) = x + y + z

fun full_name2 {first=x, middle=y, last=z} =  x ^ " " ^ y ^ " " ^ z

