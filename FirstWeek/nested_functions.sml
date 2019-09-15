
fun count1_(from: int, to: int) =
  if from = to
  then to::[]
  else from :: count1_(from + 1, to)

fun countup_from1_1(x: int) = count1_(1, x)



fun countup_from1_2(x: int) =
  let
    fun count(from: int, to: int) =
      if from = to
      then to::[]
      else from :: count(from + 1, to)
  in
    count(1, x)
  end


fun countup_from1_3(x: int) =
  let
    fun count(from: int) =
      if from = x
      then x::[]
      else from :: count(from + 1)
  in
    count(1)
  end

