fun max (xs: int list) =
  if null xs
  then NONE
  else
    let
      val tl_ans = max (tl xs)
    in
      if isSome tl_ans andalso valOf tl_ans > hd xs
      then tl_ans
      else SOME (hd xs)
    end
