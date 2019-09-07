(* This is a comment. This is our first program. *)

(* Int *)
val x = 34;
(* static env: x: int *)
(* dynamic env: x --> 34 *)

val y = 17;
(* static env: x: int, y: int *)
(* dynamic env: y --> 17 *)

val z = (x + y) + (y + 2);
(* static env: x: int, y: int, z: int *)
(* dynamic env: x --> 34, y --> 17, z --> 70 *)

val q = z + 1
(* static env: x: int, y: int, z: int, q: int *)
(* dynamic env: x --> 34, y --> 17, z --> 70, q -> 71 *)


val abs_of_z = if z < 0 then 0 - z else z; (* bool *) (* int *)
(* dynamic env: ..., abs_of_z --> 70 *)

(*  *)
val abs_of_z_simpler = abs z;

