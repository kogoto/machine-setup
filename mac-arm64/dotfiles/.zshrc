for file in $(find ~/.zsh/ -type f -name "*.zsh"); do
  if [ -r "$file" ]; then
    source "$file"
  fi
done

