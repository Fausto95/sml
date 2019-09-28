fun pow(x: int, y: int) =
  if y = 0
  then 1
  else x * pow(x, y - 1)

(* pow(2, 4) *)


fun greetings x = "Hi " ^ x

(* greetings "Faustino"; *)
