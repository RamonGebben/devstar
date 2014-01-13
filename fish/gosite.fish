function gosite

  cd (echo 'puts (Dir.pwd.start_with?("/cocky/sites/") ? Dir.pwd.split("/")[0..3].join("/") : "/cocky/sites/default")' | ruby)

end
