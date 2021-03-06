

c1push() {
  message="$1"
  pwd
  git add --all
  git commit -m "$message"
  git push
  git status
  echo
}

c1commit() {
  message="$1"
  c1push $message
  cd util
  c1push $message
  cd ../scripts
  c1push $message
  cd ..
  c1push $message
}

c1status() {
  message="$1"
  git status
  cd util
  git status
  cd ../scripts
  git status
  cd ..
  git status
}


if [ $# -gt 0 ]
then
  if [ $# -eq 1 ] 
  then
    c1commit "$1"
  else
    echo "ERROR: $# args"
    echo "Usage: single arg commit message"
  fi
else
  c1commit "update"
fi
