function gosite

  cd (echo 'puts (Dir.pwd.start_with?("/devstar/sites/") ? Dir.pwd.split("/")[0..3].join("/") : "/devstar/sites/default")' | ruby)

end
