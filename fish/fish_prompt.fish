function fish_prompt
  echo

  set_color -b 333 d91161
  echo -n $USER

  set_color -b 333 666
  echo -n "@"

  set_color cyan
  echo -n (hostname)

  set_color 666
  echo -n ":"

  set_color green
  echo -n $PWD

  set_color white
  echo -n ""

  set_color -b normal normal
  echo " "
  echo -n '» '

end
