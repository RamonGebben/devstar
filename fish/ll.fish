function ll -d "Simplified long directory listing"
  ls -Sgh --color=always --classify --group-directories-first $argv | tail -n+2
end
